# Inside src/controllers/user_controller.cr
require "crypto/bcrypt"

module GitBlue
  class UserController
    # Handles user registration and stores a hashed password in the DB
    def self.register(username : String, password : String) : Bool
      return false if username.blank? || password.size < 6

      clean_username = username.strip.downcase
      
      # Hash the password securely using Bcrypt (makes it safe for open-source repos)
      password_hash = Crypto::Bcrypt::Password.create(password, cost: 10).to_s

      begin
        GitBlue::DB.exec(
          "INSERT INTO users (username, password_hash) VALUES (?, ?);",
          clean_username,
          password_hash
        )
        true
      rescue e
        # Handles UNIQUE constraint failures (username already taken)
        false
      end
    end

    # Verifies user credentials during login
    def self.authenticate(username : String, password : String) : Bool
      return false if username.blank? || password.blank?

      clean_username = username.strip.downcase

      # Fetch the stored hash from the database
      stored_hash = GitBlue::DB.query_one?(
        "SELECT password_hash FROM users WHERE username = ? LIMIT 1;",
        clean_username,
        as: String
      )
      
      return false if stored_hash.nil?

      # Compare the plain text password against the cryptographically secure hash
      bcrypt_password = Crypto::Bcrypt::Password.new(stored_hash)
      bcrypt_password == password
    rescue e
      false
    end
  end
end

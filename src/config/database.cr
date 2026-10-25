require "db"
require "sqlite3"

module Database
  # Create a database connection pool pointing to a local file
  DB = ::DB.open("sqlite3://./storage/gitblue.db")

  # Run an initialization function to set up the database tables if they don't exist
  def self.init_db
    # Ensure the storage folder exists
    Dir.mkdir_p("./storage")

    # Create users table
    DB.exec "CREATE TABLE IF NOT EXISTS users (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      username TEXT UNIQUE NOT NULL,
      password_hash TEXT NOT NULL,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    );"
  end
end

# Automatically trigger the migration/setup on boot
Database.init_db

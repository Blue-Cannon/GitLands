require "kemal"
require "kemal-session"

# 1. Disable automatic file serving from the public/ folder
# This blocks users from typing '.html' extensions in the browser URL bar
Kemal.config.serve_static = false

# 2. Configure the secure session engine for user login states
Kemal::Session.config do |config|
  # Reads from system environment variables or dynamically generates a safe key on boot
  config.secret = ENV.fetch("GITBLUE_SECRET", Random::Secure.hex(32))
end

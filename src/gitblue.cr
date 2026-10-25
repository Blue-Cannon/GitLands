require "kemal"
require "kemal-session"

# Dispatch initialization and configuration setups first
require "./config/*"

# Dispatch your core application architecture layers
require "./controllers/*"
require "./middleware/*"
require "./routes/*"

# Boot the engine
Kemal.run

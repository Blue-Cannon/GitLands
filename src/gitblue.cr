require "kemal"
require "kemal-session"

# Dispatch initialization and configuration setups first
require "./config/*"

# Dispatch your core application architecture layers
require "./controllers/*"
require "./middleware/*"
require "./routes/*"

# Dispatch a CLI Tool for Crystal Ruby-Like code.
require "./cli/*"

# Boot the engine
Kemal.run

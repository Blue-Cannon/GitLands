# src/gitlands.cr
require "kemal"

# Serve the clean index.html file directly from the filesystem
get "/" do |env|
  env.response.content_type = "text/html"
  File.read("src/views/index.html")
end

# Keep our server running
Kemal.run

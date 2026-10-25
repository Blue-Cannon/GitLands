class GitBlue::CleanUrlHandler < Kemal::Handler
  def call(env)
    path = env.request.path

    # Check if the visitor is trying to explicitly use an .html extension
    if path.ends_with?(".html")
      # Strip the ".html" extension from the path
      clean_path = path.rchop(".html")
      
      # If the path becomes empty (e.g., /index.html), redirect to root
      clean_path = "/" if clean_path.empty?

      # Redirect the browser to the clean, extensionless URL
      env.redirect clean_path
    else
      # Move to the next handler/route if the URL is already clean
      call_next(env)
    end
  end
end

# Inside src/controllers/git_file_controller.cr

module GitBlue
  class GitFileController
    # Explicit definition of the core Git standard files we track
    GIT_STANDARD_FILES = {
      gitignore:    ".gitignore",
      gitattributes: ".gitattributes",
      gitmodules:   ".gitmodules",
      readme:       "README.md",
    }

    # Checks which standard Git files exist in a local workspace directory
    def self.detect_standard_files(workspace_path : String) : Hash(Symbol, Bool)
      status_map = {} of Symbol => Bool

      GIT_STANDARD_FILES.each do |key, filename|
        full_path = File.join(workspace_path, filename)
        status_map[key] = File.exists?(full_path)
      end

      status_map
    end

    # Reads and parses a .gitignore file into an array of clean pattern rules
    def self.parse_gitignore(workspace_path : String) : Array(String)
      ignore_path = File.join(workspace_path, GIT_STANDARD_FILES[:gitignore])
      return [] of String unless File.exists?(ignore_path)

      rules = [] of String
      File.each_line(ignore_path) do |line|
        clean_line = line.strip
        # Skip empty lines and comment blocks
        next if clean_line.empty? || clean_line.starts_with?("#")
        rules << clean_line
      end
      rules
    end

    # Automatically generates a standard default .gitignore configuration text
    # based on the environment (useful when users create repos via the Web UI)
    def self.generate_default_gitignore(project_type : String) : String
      case project_type.downcase
      when "crystal"
        <<-TEXT
        # Crystal standard ignores
        /bin/
        /lib/
        /docs/
        .crystal/
        .shards/
        shard.lock
        TEXT
      when "node", "javascript"
        <<-TEXT
        # Node standard ignores
        node_modules/
        npm-debug.log
        .env
        TEXT
      else
        "# Default GitBlue .gitignore\n.DS_Store\n"
      end
    end
  end
end

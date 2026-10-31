require "http/client"
require "json"

module Dkit
  class ApiClient
    def initialize(@host : String = "https://git.yourdomain.com", @token : String? = Config.token)
    end

    def get(path)
      headers = HTTP::Headers{"Authorization" => "Bearer #{@token}", "Accept" => "application/json"}
      response = HTTP::Client.get("#{@host}/api/v1#{path}", headers)
      handle(response)
    end

    def post(path, body)
      headers = HTTP::Headers{"Authorization" => "Bearer #{@token}", "Content-Type" => "application/json"}
      response = HTTP::Client.post("#{@host}/api/v1#{path}", headers, body.to_json)
      handle(response)
    end

    private def handle(res)
      case res.status_code
      when 401
        STDERR.puts "Not authenticated. Run: my_cli auth login"
        exit 1
      when 200..299
        JSON.parse(res.body)
      else
        STDERR.puts "API Error #{res.status_code}: #{res.body}"
        exit 1
      end
    end
  end
end

require "faraday"
require "json"
require "ostruct"
require_relative 'response'

module GithubItems
  class Client
    attr_accessor :conn
    attr_accessor :path_prefix

    def initialize(options={})
      options[:url] ||= "http://localhost:7000"
      @conn = Faraday.new(:url => options[:url])
    
      if options[:path_prefix]
        @path_prefix = options[:path_prefix]
      else
        @path_prefix = ""
      end

      if token = options[:token]
        @token = token
      end
      @options = options
    end

    def get_repos_from_authentication_token(github_authorization_token)
      attr_hash = { :github_authorization_token => github_authorization_token }
      resp = @conn.get do |req|
        req.url "#{@path_prefix}/api/v1/repos.json"
        req.params["token"] = @token
        req.params["body"] = JSON.dump(attr_hash)
        req.headers['Content-Type'] = 'application/json'
      end
      response = GithubItems::Response.new(resp.status, OpenStruct.new(JSON.parse(resp.body)))
    end

  end
end

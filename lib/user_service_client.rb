require "faraday"
require "json"
require "ostruct"
require_relative 'response'

module UserService
  class Client
    attr_accessor :conn
    attr_accessor :path_prefix

    def initialize(options={})
      options[:url] ||= "http://localhost:3000"
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

    def validate_user(user_token)
      attr_hash = { :user_token => user_token }

      resp = @conn.get do |req|
        req.url "#{@path_prefix}/api/v1/users.json"
        req.params["token"] = @token
        req.params["body"] = JSON.dump(attr_hash)
        req.headers['Content-Type'] = 'application/json'
      end

      response = UserService::Response.new(resp.status, OpenStruct.new(JSON.parse(resp.body)))
    end
  end
end
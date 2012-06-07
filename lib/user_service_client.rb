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

    def get_user_info
      resp = @conn.get do |req|
        req.url "#{@path_prefix}/api/v1/users/1"
        req.params["token"] = @token
        req.headers['Content-Type'] = 'application/json'
      end

      response = UserService::Response.new(resp.status, OpenStruct.new(JSON.parse(resp.body)))
    end
  end
end
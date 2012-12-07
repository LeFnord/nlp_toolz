require 'uri'
require 'net/http'

module UrlHandler
  module ClassMethods
  end
  
  # instance methods
  def build_url(host, port, path, query)
    return URI::HTTP.build({:host => host, :path => path, :query => query}) if port.nil?
    return URI::HTTP.build({:host => host, :port => port, :path => path, :query => query}) unless port.nil?
  end
  
  
  def post_data(content,uri,content_type)
    post = Net::HTTP::Post.new(uri.request_uri,content_type)
    post.body = content.force_encoding("utf-8")
    uri_response = Net::HTTP.start(uri.host,uri.port) {|http| http.request(post)}
    
    uri_response
  end
  
  def self.included(receiver)
    receiver.extend ClassMethods
  end
end

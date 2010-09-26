require 'net/http'
require 'net/https'
require 'uri'
require 'cgi'

module AussieSMS
  extend self
  API_URL = "https://api.aussiesms.com.au"
  @from = "AussieSMS"

  def id
    @id
  end

  def id=(value)
    @id = value
  end

  def password
    @password
  end

  def password=(value)
    @password = value
  end

  def from
    @from
  end

  def from=(value)
    @from = value
  end

  def send(message, options={})
    apicall("sendsms", {
      :text => message,
      :to => options[:to],
      :from => options[:from] || @from,
      :mobileID => @id,
      :password => @password,
      :msg_type => "SMS_TEXT"
    })
  end

  def balance
    apicall("querybalance", {
      :mobileID => @id,
      :password => @password
    }).body.to_i
  end

  private

  def apicall(action, args)
    uri = URI.parse(API_URL)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new("/?#{action}&#{encode_args(args)}")
    http.request(request)
  end

  def encode_args(args)
    args.to_a.collect! { |k,v|
      "#{k.to_s}=#{CGI::escape(v)}"
    }.join("&")
  end
end

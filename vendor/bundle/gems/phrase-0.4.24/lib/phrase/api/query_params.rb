require "cgi"

class Phrase::Api::QueryParams
  def self.encode(value, key=nil)
    case value
      when Array then value.map { |v| encode(v, "#{key}[]") }.join("&")
      when Hash then value.map { |k,v| encode(v, append_key(key,k)) }.join("&")
      when nil then ""
      else
        "#{key}=#{CGI.escape(value.to_s)}"
      end
  end

  def self.append_key(root_key, key)
    if root_key.nil?
      key
    else
      "#{root_key}[#{key.to_s}]"
    end
  end
  private_class_method :append_key
end

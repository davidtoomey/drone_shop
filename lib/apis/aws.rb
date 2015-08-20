class AmazonProductAdvertisingApiSigner
    
    attr_accessor :url, :secret

    def initialize(url:, secret:)
      self.url = url
      self.secret = secret
    end

    def sign
      host_and_path, params = *self.url.split("?")
      params = params.gsub(",","%2C").gsub(":","%3A")
      canonical = params.split("&").sort.join("&")
      data = ['GET', 'ecs.amazon.com', '/onca/xml', canonical].join("\n")
      sha256 = OpenSSL::Digest::SHA256.new
      sig = OpenSSL::HMAC.digest(sha256, self.secret, data)
      signature = Base64.encode64(sig).strip
      signature = signature.gsub("+", "%2B").gsub("=", "%3D")
      "#{host_and_path}?#{canonical}&Signature=#{signature}"
    end

  end

  # class usage.  
  # Note, you must use your own secret and accesskey get them by signing up at the following url
  # https://affiliate-program.amazon.com/gp/flex/advertising/api/sign-in.html

  signer = AmazonProductAdvertisingApiSigner.new(secret: "x6e1G5s5o5t4jZ5lJv+Vly0aFIYeZUi+68kyda8W", url: "http://webservices.amazon.com/onca/xml?Service=AWSECommerceService&AWSAccessKeyId=AKIAIOSFODNN7EXAMPLE&AssociateTag=mytag-20&Operation=ItemLookup&ItemId=0679722769&ResponseGroup=Images,ItemAttributes,Offers,Reviews&Version=2013-08-01&Timestamp=2014-08-18T12:00:00Z")
  signed_url = signer.sign
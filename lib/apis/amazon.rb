require 'net/https'
require 'json'
require 'amazon/ecs'
require 'openssl'
require 'amazon/aws/search'

    include Amazon::AWS
    include Amazon::AWS::Search

class APIS::Amazon

    def get_signature 
      secret_key = 'x6e1G5s5o5t4jZ5lJv+Vly0aFIYeZUi+68kyda8W'
      query = 'AWSAccessKeyId=AKIAIPP52YWRIPB6TP6Q&ItemId=0679722769&Operation=ItemLookup&ResponseGroup=ItemAttributes%2COffers%2CImages%2CReviews&Service=AWSECommerceService'
      data = ['GET', 'ecs.amazonaws.com', '/onca/xml', query].join("\n")
      sha256 = OpenSSL::Digest::SHA256.new
      sig = OpenSSL::HMAC.digest(sha256, secret_key, data)
      @signature = Base64.encode64(sig)
    end

    def ruby_aws
    is = ItemSearch.new( 'Baby',
     {
     'Keywords' => 'pants',
     'MinimumPrice' => '2500',
     'MaximumPrice' => '4999'
     } )
   ResponseGroup.new( 'Small' )
     
    req = Request.new
    req.locale = 'us'
     
    resp = req.search( is )
    items = resp.item_search_response[0].items[0].item
     
    @answer = items.each { |item| puts item, '' }
  end

    def get_product
        uri = URI("http://ecs.amazonaws.com/onca/xml?AWSAccessKeyId=AKIAIPP52YWRIPB6TP6Q&AssociateTag=dronez-20&Keywords=dji%20phantom&Operation=ItemSearch&SearchIndex=Electronics&Service=AWSECommerceService&Timestamp=2015-08-19T20%3A14%3A43.000Z&Version=2011-08-01&Signature=#{get_signature}")
        puts uri

        result = Nokogiri::XML.parse(Net::HTTP.get(uri))
        # Hash.from_xml result


    end

    def get_phantom 
         uri = URI("http://ecs.amazonaws.com/onca/xml?AWSAccessKeyId=AKIAIPP52YWRIPB6TP6Q&AssociateTag=dronez-20&Keywords=DJI%20Phantom%20Aerial%20UAV%20Drone%20Quadcopter%20for%20GoPro&Operation=ItemSearch&SearchIndex=Electronics&Service=AWSECommerceService&Timestamp=2015-08-20T21%3A31%3A06.000Z&Version=2011-08-01&Signature=#{get_signature}")
        puts uri

        @result = Nokogiri::XML.parse(Net::HTTP.get(uri))
        @result.remove_namespaces!
    end

    def get_phantom_pics
        uri = URI("http://webservices.amazon.com/onca/xml?
                   Service=AWSECommerceService
                   &Operation=ItemLookup
                   &ResponseGroup=Images
                   &IdType=ASIN&
                   &ItemId= B00AGOSQI8
                   &AWSAccessKeyId=AKIAIPP52YWRIPB6TP6Q
                   &AssociateTag=dronez-20
                   &Timestamp=2015-08-20T15%3A17%3A10.000Z
                   &Signature=[Request_Signature]")
    end
end
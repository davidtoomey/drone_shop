require 'net/https'
require 'json'
require 'amazon/ecs'
require 'openssl'
require 'amazon/aws/search'
require 'rubygems'
require 'base64'
require 'cgi'
require 'hmac-sha1'

    include Amazon::AWS
    include Amazon::AWS::Search

class APIS::Amazon
    

    def vacuum
      request = Vacuum.new
      request.configure(
        aws_access_key_id: ,
        aws_secret_access_key: ,
        associate_tag: 'dronez-20'
        )
      request.associate_tag = 'dronez-20'
      response = request.browse_node_lookup(
        query: {
          'BrowseNodeId' => 123
        }
        )
    end




    def get_siggy 

      hmac = HMAC::SHA1.new(key)
      hmac.update(signature)
      CGI.escape(Base64.encode64("#{hmac.digest}\n"))
    end

    def get_signature 
     
      data = ['GET', 'ecs.amazonaws.com', '/onca/xml', query].join("\n")
      sha1 = OpenSSL::Digest::SHA1.new
      sig = OpenSSL::HMAC.digest(sha1, secret_key, data)
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
        
        puts uri

        result = Nokogiri::XML.parse(Net::HTTP.get(uri))
        # Hash.from_xml result


    end

    def get_phantom 
         @time = Time.now
         
        puts uri

        @result = Nokogiri::XML.parse(Net::HTTP.get(uri))
        @result.remove_namespaces!
    end

    def get_phantom_pics
      
    end
end
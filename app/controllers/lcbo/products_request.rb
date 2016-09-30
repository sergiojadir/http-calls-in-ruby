module Lcbo
	class ProductsRequest
		attr_accessor :key, :connection, :page_number

		def initialize(key, connection, page_number)
			@key = key
			@connection = connection
			@page_number = page_number
		end

		def response()
			begin
				http_response = connection
					.headers('Authorization' => "Token #{key}")
					.get(url)
				ProductResponse.new(http_response)
			rescue
				nil
			end
		end

		def url
			"https://lcboapi.com/products?page=#{page_number}"
		end
	end
end
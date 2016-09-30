module Lcbo
	class ProductRequest
		attr_reader :key, :product_id, :connection

		def initialize(key, product_id, connection)
			@key = key
			@product_id = product_id
			@connection = connection
		end

		def response
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
			"https://lcboapi.com/products/#{product_id}"
		end
	end
end
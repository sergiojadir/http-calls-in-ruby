module Lcbo
	require_relative 'product_request'
	require_relative 'product_response'

	class Products

		attr_accessor :key, :connection, :total_record_count

		def initialize(key)
			@key = key
			@connection = HTTP
		end

		def all(page=1)
			product_response = ProductsRequest.new(key, connection, page).response

			response_is_valid?(product_response)

			self.total_record_count = product_response.total_record_count

			product_response.products
		end

		def fetch(product_id)
			product_response = ProductRequest.new(key, product_id, connection).response

			response_is_valid?(product_response)

			product_response.product
		end

		private
		def response_is_valid?(product_response)
			raise "Connection Error" if product_response.nil?
			fail LcboError, product_response.error_message unless product_response.success?
		end
	end
end
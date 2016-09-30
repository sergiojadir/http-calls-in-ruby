module Lcbo
	class ProductResponse
		attr_reader :http_response

		DEFAULT_ERROR_MESSAGE = 'There whas an error retrieving product details.'.freeze

		def initialize(http_response)
			@http_response = http_response
		end

		def success?
			http_response.status == 200
		end

		def error_message
			data.fetch('message', DEFAULT_ERROR_MESSAGE)
		end

		def products
			data.fetch('result').map { |result| Product.new(result) }
		end

		def product
			Product.new(data.fetch('result'))
		end

		def total_record_count
			data.fetch('pager').fetch('total_record_count')&.to_i
		end

		private

		def data
			http_response.parse(:json)
		end
	end
end
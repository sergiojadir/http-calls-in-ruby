module Lcbo
	class Product
		attr_accessor :details

		def initialize(details)
			@details = details
		end

		def id
			details['id']
		end

		def name
			details['name']
		end

		def tags
			details.fetch('tags', '').split(' ')
		end

		def price_in_cents
			details['price_in_cents']
		end

		def bonus_reward_miles
			details['bonus_reward_miles']
		end

		def volume_in_milliliters
			details['volumne_in_milliliters']
		end

		def alcohol_content
			details['alcohol_content']
		end
	end
end
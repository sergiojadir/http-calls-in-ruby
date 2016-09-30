class ProductsController < ApplicationController
	before_action :set_key

	def index
		lcbo_products = Lcbo::Products.new(@key)
		@products = lcbo_products.all(params[:page])
		
		total_record_count = lcbo_products.total_record_count
		@pages = Kaminari.paginate_array((0...total_record_count).map { |i| i}).page(params[:page]).per(20)
	end

	def show
		@product = ProductPresenter.new(Lcbo::Products.new(@key).fetch(params[:id]))
	end

	private
	def set_key
		@key = ENV.fetch('LCBO_API_KEY')
	end
end
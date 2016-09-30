class ProductPresenter < Burgundy::Item
	include ActionView::Helpers

	def tags
		raw item.tags.map { |p| "<span class='tag tag-primary'>#{p.titleize}</span>" }.join(" ")
	end

	def price_in_cents
		number_with_precision(item.price_in_cents, precision: 2, separator: '.')
	end

end
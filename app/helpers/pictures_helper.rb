module PicturesHelper

	def item_first
		if @pictures.first 
			'active'
		else
			''
		end
	end
end

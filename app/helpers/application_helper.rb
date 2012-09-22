module ApplicationHelper	
	def get_base_url
		base_url="http://localhost:3000/"
		base_url
	end

	def get_favicon(link)
		return image_tag link.favicon unless link.favicon.nil?
	end
end

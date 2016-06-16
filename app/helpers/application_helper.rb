module ApplicationHelper
	# function tra ve title cho cac page
	def full_title(page_title = '')
		default_title = "Rails Sample App"
		if page_title.empty?
			default_title
		else
			page_title + "|" + default_title
		end
	end
end

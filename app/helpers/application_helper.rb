module ApplicationHelper
	#returns the full title on a per-page basis
	def full_title(page_title)
		if page_title.empty? 
			base_title
		else
			"#{page_title}"
		end
	end

	def check_booth_for_attendance(b)
		unless b.nil?
			return b
		else
			return "0"
		end
	end
end

module ApplicationHelper
	def set_as_active(controller)
		'active' if controller == params[:controller]
	end
end

class CoursesController < ApplicationController
	def index
		@courses = Course.all
	end
	def search
	end
	def search_result
		@keyword = params[:keyword]
		if !@keyword.blank?
      @courses = Course.where(["name LIKE ?", "%#{@keyword}%"])
    else
      @courses = Course.order("created_at DESC")
    end
	end
end

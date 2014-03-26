class CoursesController < ApplicationController
	before_action :signed_in_user
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
	def register
		@checked_courses=[]
		@checked = params[:courses_id]
		@checked.each do |c|
			course = Course.where("id = '#{c}")
			#現在のユーザーに新しいcourseの関連づけ
			current_user.user_courses.create(course_id:c)
			@checked_courses.push course 
		end
	end
end

class Instructor::LessonsController < ApplicationController

  before_action :authenticate_user!
  before_action :require_authorized_for_current_section

  def new
    @lesson = Lesson.new
  end


  def create
    @section = @course.sections.create(lesson_params)
    redirect_to instructor_course_path(current_course)
  end
 

  private
  def require_authorized_for_current_section
    if current_course.user != current_user
      render plain: "Unauthorized", status: :unauthorized
    end
  end

  helper_method :current_course
  def current_course
    @current_course ||= Course.find(params[:course_id])
  end

  def lesson_params
    params.require(:lesson).permit(:title)
  end

end

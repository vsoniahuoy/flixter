class Instructor::LessonsController < ApplicationController
<<<<<<< HEAD
  before_action :authenticate_user!
  before_action :require_authorized_for_current_section

  def new
    @leson = Lesson.new
  end

  def create
    @lesson = current_section.lessons.create(lesson_params)
    redirect_to instructor_course_path(current_section.course)
=======
  def new
    @section = Section.find(params[:section_id])
    @lesson = Lesson.new
  end

  def create
    @section = Section.find(params[:section_id])
    @lesson = @section.lessons.create(lesson_params)
    redirect_to instructor_course_path(@section.course)
>>>>>>> 7b1d9ffd67c6983fbcc41ab70613cd042bc52146
  end

  private

<<<<<<< HEAD
  def require_authorized_for_current_section
    if current_section.course.user != current_user
      return render plain: 'Unauthorized', status: :unauthorized
    end
  end

  helper_method :current_section
  def current_section
    @current_section ||= Section.find(params[:section_id])
  end

=======
>>>>>>> 7b1d9ffd67c6983fbcc41ab70613cd042bc52146
  def lesson_params
    params.require(:lesson).permit(:title, :subtitle)
  end

end

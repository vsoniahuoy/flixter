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
 
  # def new
  #   @section = Section.find(params[:section_id])
  #   @lesson = Lesson.new
  # end

  # def create
  #   @section = Section.find(params[:section_id])
  #   @lesson = @section.lessons.create(lesson_params)
  #   redirect_to instructor_course_path(@section.course)

  # end

  private



  helper_method :current_course
  def current_course
    @current_course ||= Course.find(params[:course_id])
  end

  def lesson_params
    params.require(:lesson).permit(:title)
  end

end

class Instructor::LessonsController < ApplicationController

  before_action :authenticate_user!
  before_action :require_authorized_for_current_section

  def new
    # @section = Section.find(params[:section_id])
    # @section = current_section
    # if @section.course.user != current_user
    # if current_section.course != current_user
    #   return render plain: 'Unauthorized', status: :unauthorized
    # end
    @lesson = Lesson.new
  end


  def create
    # @section = Section.find(params[:section_id])
    # @section = current_section
    # if @section.course.user != current_user


    # Create a method for this block
    # if current_section.course.user != current_user
    #   return render plain: 'Unauthorized', status: :unauthorized
    # end
    ############################

    # @lesson = @section.lessons.create(lesson_params)
    # redirect_to instructor_course_path(@section.course)    
   @lesson = current_section.lessons.create(lesson_params)
   redirect_to instructor_course_path(current_section.course)
  end
 

  private
  def require_authorized_for_current_section
    if current_section.course != current_user
      return render plain: 'Unauthorized', status: :unauthorized
    end
  end

  # the helper_method will allow the view to call it "current_section" instead of
  # @section
  helper_method :current_section
  def current_section
    @current_section ||= Section.find(params[:section_id])
  end

  def lesson_params
    params.require(:lesson).permit(:title, :subtitle)
  end

end

class PhotosController < ApplicationController
  before_action :authenticate_user!

  def create
    @course = current_section.lessons.create(lesson_params)
    @course.photos.create(photo_params.merge(user: current_user))
    redirect_to instructor_course_path(current_course)
  end



  private

  helper_method :current_section
  def current_section
    @current_section ||= Section.find(params[:section_id])
  end

  def lesson_params
    params.require(:lesson).permit(:title, :subtitle)
  end

  def photo_params
    params.require(:course).permit(:image, :caption)
  end

end

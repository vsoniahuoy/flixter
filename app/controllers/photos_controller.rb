class PhotosController < ApplicationController
  before_action :authenticate_user!

  def create
    @lesson = current_section.lessons.create(lesson_params)
    @lesson.photos.create(photo_params.merge(user: current_user))
    redirect_to lesson_path(@lesson)
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

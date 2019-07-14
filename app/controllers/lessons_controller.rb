class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson, only: [:show]

  def show
  end


  private

  def require_authorized_for_current_lesson
    if current_lesson.section.user != current_user.enrolled_in?(current_lesson)
      redirect_to course_path(current_lesson), alert: 'You must enroll before viewing the lesson'
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end

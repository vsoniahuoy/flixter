class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @section = Section.new
    @lesson = Lesson.new

  end

  def course_params
    params.require(:course).permit(:title, :description, :cost, :image)
  end
end


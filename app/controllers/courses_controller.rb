class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.all

    respond_with(@courses)
  end

  def new
    @course = Course.new

    respond_with(@course)
  end

  def create
    @course = Course.create(course_params)
    respond_with(@course, location: @course)
  end

  def show; end

  def edit; end

  def update
    @course.update_attributes(course_params)
    respond_with(@course, location: @course)
  end

  def destroy
    @course.destroy
    respond_with(nil, location: courses_path)
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, :status)
  end

  def set_course
    @course = Course.find(params[:id])
  end
end

class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all

    respond_with(@students)
  end

  def new
    @student = Student.new

    respond_with(@student)
  end

  def create
    @student = Student.create(student_params)
    respond_with(@student, location: @student)
  end

  def show; end

  def edit; end

  def update
    @student.update_attributes(student_params)
    respond_with(@student, location: @student)
  end

  def destroy
    @student.destroy
    respond_with(nil, location: students_path)
  end

  private

  def student_params
    params.require(:student).permit(:name, :register_number, :status)
  end

  def set_student
    @student = Student.find(params[:id])
  end
end

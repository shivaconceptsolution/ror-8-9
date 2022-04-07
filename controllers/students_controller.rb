class StudentsController < ApplicationController
	def index
    
       @students = Student.all
    end  
    
  def new

    @course = Course.find(params[:q])
    @cr = Course.all
  end
  def create
    #@student = Student.new(student_params)
    @course = Course.find(1)
    @student = @course.students.create(student_params)
    if @student.save
      redirect_to '/students/index'
    else
      render :new, status: :unprocessable_entity
    end
  end
  private
    def student_params
      params.require(:student).permit(:rno, :sname, :branch,:course_id)
    end
end

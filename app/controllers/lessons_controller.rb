class LessonsController < ApplicationController

  def index
    @lessons = Lesson.all
  end

  def new
    @lesson = Lesson.new
  end

  def create
    Lesson.create(lesson_params)
    redirect_to root_path
  end


  private 

  def lesson_params
    params.require(:lesson).permit(:name, :description, :where)
  end

end

class LessonsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @lessons = Lesson.all
  end

  def new
    @lesson = Lesson.new
  end

  def create
    current_user.lessons.create(lesson_params)
    redirect_to root_path
  end


  def show
    @lesson = Lesson.find(params[:id])
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    @lesson.update_attributes(lesson_params)
    redirect_to root_path
  end



  private 

  def lesson_params
    params.require(:lesson).permit(:name, :description, :where)
  end

end

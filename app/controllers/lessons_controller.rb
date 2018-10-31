class LessonsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @lessons = Lesson.all
  end

  def new
    @lesson = Lesson.new
  end

  def create
    current_user.lessons.create(lesson_params)
    redirect_to lessons_path
  end


  def show
    @lesson = Lesson.find(params[:id])
  end

  def edit
    @lesson = Lesson.find(params[:id])

    if @lesson.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end

    @lesson.update_attributes(lesson_params)
    redirect_to lessons_path
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    if @lesson.user != current_user
      return render plain: "Not Allowed", status: :forbidden
    end
    
    @lesson.destroy
    redirect_to lessons_path
  end


  private 

  def lesson_params
    params.require(:lesson).permit(:name, :description, :where)
  end

end

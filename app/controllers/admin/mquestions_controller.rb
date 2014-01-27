class Admin::MquestionsController < ApplicationController


  def index
    @questions = Mquestion.all
  end

  def create
    @question = Mquestion.new(person_params)
    if  @question.save
      flash[:notice] = "Вопрос добавлен"
      redirect_to(admin_mquestions_path)
    else
      render(:action => 'new')
    end
  end

  def new
    @question = Mquestion.new
  end

  def edit
    @question = Mquestion.find(params[:id])
  end

  def show
    @question = Mquestion.find(params[:id])
  end

  def update
    @question = Mquestion.find(params[:id])
    if @question.update!(person_params)
      flash[:notice] = "Данные обновленны."
      redirect_to(admin_mquestions_path)
    else
      render(:action => 'edit')
    end
  end

  def destroy
    Mquestion.destroy(params[:id])
    flash[:notice] = "Вопрос удален"
    redirect_to(admin_mquestions_path)
  end

  private
  def person_params
    params.require(:mquestion).permit(:question, :answer1,:answer2,:answer3,:answer4,:answer5, :showdate, :rightanswer)
  end
end

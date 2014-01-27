class Admin::WinersController < ApplicationController

def index
  #Winer.createwiners
  @winers = Winer.paginate(:page => params[:page], :per_page => 25)
end

  def destroy
    Winer.destroy(params[:id])
    flash[:notice] = "Победитель удален"
    redirect_to(admin_winers_path)
  end

  def recreate

    render :action => 'index'
  end
end

class Admin::UsersController < Admin::AdminController

   #before_filter :ensure_login #, :only => [:edit, :update, :destroy]
   # before_filter :ensure_logout, :only => [:new, :create]



  def index
    @people = Admin::User.all
    @ses = Admin::Session.all
  end

  def show
    @person = Admin::User.find(params[:id])
  end

  def new
    @person = Admin::User.new
  end

  def create
    @person = Admin::User.new(person_params)
    if  @person.save
       @session = @person.sessions.create
      # session[:id] = @session.id
      flash[:notice] = "Пользователь #{@person.name}, зарегестрирован"
      redirect_to(admin_users_path)
    else
      render(:action => 'new')
    end
  end

  def edit
    @person = Admin::User.find(params[:id])
  end

  def update
    @person = Admin::User.find(params[:id])
    if @person.update!(person_params)
      flash[:notice] = "Данные пользователя обновленны."
      redirect_to(admin_users_path)
    else
      render(:action => 'edit')
    end
  end

  def destroy
    Admin::User.destroy(params[:id])
    session[:id] = @user = nil
    flash[:notice] = "Пользователь удален"
    redirect_to(admin_users_path)
  end

  private
  def person_params
    params.require(:admin_user).permit(:name, :password)
  end
end

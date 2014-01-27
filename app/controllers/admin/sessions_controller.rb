class Admin::SessionsController < Admin::AdminController
  before_filter :ensure_login, :only => :destroy
  before_filter :ensure_logout, :only => [:create]

  def index
    redirect_to(new_admin_session_path)
  end

  def new
    @user = Admin::User.new
    @session = Admin::Session.new
  end

  def create
    @user = Admin::User.find_by_name_and_password(params[:admin_user][:name], params[:admin_user][:password])
    if @user
      @session = Admin::Session.new(:ip_address => request.remote_addr,
                                    :path => request.path_info,
                                    :user_id => @user.id)
       @session.save
        session[:id] = @session.id
        flash[:notice] = "С возвращением #{@user.name}"
        redirect_to(admin_path)
    else
      flash[:notice] = 'Такого пользователя нет '
      redirect_to :action => 'new'
    end

  end

  def destroy
    Admin::Session.destroy(@application_session)
    session[:id] = @user = nil
    flash[:notice] = "Вы вышли"
    redirect_to(admin_path)
  end

end

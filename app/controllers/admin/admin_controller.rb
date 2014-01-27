class Admin::AdminController < ApplicationController

  helper :all # include all helpers, all the time

# before_filter :maintain_session_and_user,  :ensure_login

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '3ef815416f775098fe977004015c6193'

  def login

  end

  def index
     @info_ip = request.remote_ip()
     Time.zone = 'Moscow'
     @time= Time.zone.now

    @mem_count = Member.all.size
  end


  def ensure_login
    unless @user
      flash[:notice] = "Пожалуйста войдите чтобы продолжить"
      redirect_to(new_admin_session_path)
    end
  end

  def ensure_logout
    if @user
      flash[:notice] = ""
      redirect_to(admin_path)
    end
  end

  private

  def maintain_session_and_user
    if session[:id]
      if @application_session = Admin::Session.find_by_id(session[:id])
        @application_session.update_attributes(
            :ip_address => request.remote_addr,
            :path => request.path_info
        )
        @user = @application_session.user
      else
        session[:id] = nil
        redirect_to(admin_path)
      end
    end
  end
end

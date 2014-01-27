class Admin::MembersController < ApplicationController



  def index
    @members = Member.paginate(:page => params[:page], :per_page => 25)
    @members_answ = Bike.all
    respond_to do |format|
      format.html
      format.xls
    end
  end

  def create
    @member = Member.new(person_params)
    if  @member.save
      flash[:notice] = "Пользователь #{@member.name}, зарегестрирован"
      redirect_to(admin_members_path)
    else
      render(:action => 'new')
    end
  end

  def new
    @member = Member.new
  end

  def edit
    @member = Member.find(params[:id])
  end

  def show
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update!(person_params)
      flash[:notice] = "Данные пользователя обновленны."
      redirect_to(admin_members_path)
    else
      render(:action => 'edit')
    end
  end

  def destroy
    Member.destroy(params[:id])
    flash[:notice] = "Пользователь удален"
    redirect_to(admin_members_path)
  end

  private
  def person_params
    params.require(:member).permit(:name, :soname, :age, :city, :country, :phone, :mail, :win)
  end
end

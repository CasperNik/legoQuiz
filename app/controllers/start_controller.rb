class StartController < ApplicationController

  before_filter :timezone

  @@page = 'login'
  def index
    vic = checked
    if vic
      t= Time.zone.now
      @time= t.strftime("%Y-%m-%d")
      @mquestion = Mquestion.where(showdate:@time).last
      @member = Member.new
      i=3
      @age_list = Hash.new
        while i<35 do
        @age_list[i] = i
        i+=1
        end
      render 'index'
    else
      render @@page
    end

  end

  def new
    @member = Member.new(person_params)
    # получить правильный ответ
    t= Time.zone.now
    @time= t.strftime("%Y-%m-%d")
    question = Mquestion.where(showdate:@time).last
    a1=params[:answer]
    a2=question.rightanswer
      if ( a1.to_i == a2.to_i)
        @member.win = true
      else
        @member.win = false
      end
    @member.ip = request.remote_ip().to_s
    @member.save
    render :partial => "index2"
  end

  def quest2
    @member = Member.find(params[:member][:id])
    logger.info(params[:description]);
    answer = @member.create_bike
    answer.answer = params[:description].to_s
    answer.save
    render :partial => 'index3'
  end

  private
  def person_params
    params.require(:member).permit(:name, :soname, :age, :city, :country, :phone, :mail)
  end

  def checked
    return true
    if checkTime
       return checkMember
    else
     return false
     @@page='nostart'
    end
  end

  def checkTime
    return true
  end

  def checkMember
    member = Member.where(ip:request.remote_ip().to_s, created_at: (Time.zone.now.beginning_of_day)..Time.zone.now).last
    if member
      @@page='index3'
      return false
    else
      return true
    end
  end
  def timezone
    Time.zone = 'Moscow'
  end

end

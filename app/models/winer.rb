class Winer < ActiveRecord::Base

  default_scope :order => 'date DESC'


  def self.createwiners
    f = 1
    s = 100
    t = 150
    Time.zone = 'Moscow'
    members = Member.where(created_at: (Time.zone.now.midnight - 1.day)..Time.zone.now.midnight, win:true )
    i=1
    members.each  do |member|
      if i == f
        winer = self.new
         winer.memberid = member.id
         winer.date = member.created_at
         winer.save!
       end
      if i == s
        winer = self.new
        winer.memberid = member.id
        winer.date = member.created_at
        winer.save!
        end
      if i == t
        winer = self.new
        winer.memberid = member.id
        winer.date = member.created_at
        winer.save!
      end
      i=i+1
    end
  end
end

class NotifierMailer < ApplicationMailer
	default	from: 'bobcaocheng@163.com'
#					return_path: 'bobcaocheng@163.com'

  def welcome(user)
    @recipient = user[:name]
    @login_id = user[:email]
    @pass = user[:password]
    mail(to: @login_id + "@qibaodwight.org", subject: "[QDSC student connection] Welcome #{@recipient}")
  end

	def pass(user)
		@recipient = user[:name]
		@login_id = user[:email]
		@pass = user[:password]
		mail(to: @login_id + "@qibaodwight.org", subject: "[QDSC student connection] Password update")
	end
end

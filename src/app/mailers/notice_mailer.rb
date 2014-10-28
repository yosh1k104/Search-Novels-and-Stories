class NoticeMailer < ActionMailer::Base
  default :from => "t11342yk@sfc.keio.ac.jp"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_confirm.subject
  #
  def sendmail_confirm
    @greeting = "Hi"

    mail :to = current_user.email, subject: "Received Message!"
  end
end

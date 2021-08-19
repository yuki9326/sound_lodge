class ContactMailer < ApplicationMailer

  def send_mail(contact)
    @contact = contact
    mail to:    ENV['TOMAIL'], subject: '【お問い合わせ】' + @contact.subject
  end

  def send_when_admin_reply(end_user, contact)
    @end_user = end_user
    @answer = contact.reply
    mail to: end_user.email, subject: '【Sound Lodge】お問い合わせありがとうございます'
  end
end

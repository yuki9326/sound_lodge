class ContactMailer < ApplicationMailer

  def send_mail(contact)
    @contact = contact
    mail to:    ENV['TOMAIL'], subject: '【お問い合わせ】' + @contact.subject
  end

  def send_when_admin_reply(contact)
    @contact = contact
    @answer = contact.reply
    mail to: contact.email, subject: '【Sound Lodge】お問い合わせありがとうございます'
  end
end

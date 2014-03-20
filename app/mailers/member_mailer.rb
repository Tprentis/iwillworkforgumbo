class MemberMailer < ActionMailer::Base
  default from: "PWReset@iWillWorkForGumbo.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.member_mailer.password_reset.subject
  #
   def password_reset(member)
    @member = member
    mail :to => member.email, :subject => "Password Reset - iWillWorkForGumbo"
  end
end

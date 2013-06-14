class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.lead.subject
  #
  def lead_email(lead)
    @lead = lead

    mail to: "to@example.org"
  end
end

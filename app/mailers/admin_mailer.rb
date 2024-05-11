class AdminMailer < ApplicationMailer
  default from: "knowyourloan123@gmail.com"

    def broker_send(email, message, subject)
      mail(
      to: email,
      subject: subject,
      body: message
      )
    end
end

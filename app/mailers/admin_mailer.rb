class AdminMailer < ApplicationMailer
  default from: "admin@knowyourloan.site"

    def broker_send(email, message, subject)
      mail(
      to: email,
      subject: subject,
      body: message
      )
    end

    # def admin_mailer
    #   @order = params[:order]

    #   mail(
    #   to: email,
    #   subject: subject,
    #   body: message
    #   )
    # end

    def admin_mailer(order)

      # @user = params[:user]
      @order = order
      # @url = 'http://example.com/login'
      mail(to: ENV["EMAIL_ADDRESS"], subject: 'NEW BROKER SIGN UP')
    end

    def appointment_mailer(appointment, user)
      @appointment = appointment
      @current_user = user
      mail(to: ENV["BROKER_ADDRESS"], subject: 'NEW APPOINTMENT IS CREATED')
    end
end

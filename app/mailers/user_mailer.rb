class UserMailer < ApplicationMailer
    default from: 'notifications@example.com'
 
    def email_receipt(order)
        @order = order
        mail(to: @order.email, subject: 'Email reciept')
        puts "email sent?"
    end
end

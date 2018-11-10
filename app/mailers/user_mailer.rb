class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def receipt_email(user, order, lineitems)
    @user = user
    @order = order
    @lineitems = lineitems

    mail(to: @user.email, subject: "Purchase Confirmation of Order #{@order.id}")
  end
end

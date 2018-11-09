class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def receipt_email(user, order)
    @user = user
    @order_id = order
    mail(to: @user, subject: "Purchase Confirmation of Order #{@order_id}")
  end
end

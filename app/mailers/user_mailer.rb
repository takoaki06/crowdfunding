class UserMailer < ApplicationMailer
  default from: "hoge@gmail.com"

  def send_message_to_user(like)
    @like = like
    mail to: @like.product.user.email,
         subject: "いいね！されました"
  end
end

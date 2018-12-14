class NotificationMailer < ActionMailer::Base
  default from: "noreply@example.com"

  def send_confirm_to_user(blog, entry, comment)
    @blog = blog
    @entry = entry
    @comment = comment
    mail(
      subject: "コメントが投稿されました。",
      to: "admin@example.com"
    ) do |format|
      format.text
    end
  end
end

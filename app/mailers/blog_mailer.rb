class BlogMailer < ApplicationMailer
  def blog_mail(blog)
    @blog = blog
    mail to: "taaa0823@gmail.com", subject: "投稿完了メール"
  end
end

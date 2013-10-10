class FavoriteMailer < ActionMailer::Base
  default from: "mitch@bloccit-mich.com"

  def new_comment(user, post, comment)
    @user = user
    @post = post
    @comment = comment

    # New Headers
    headers["Message-ID"] = "<comments/#{@comment.id}@bloccit-mitch.com>"
    headers["In-Reply-To"] = "<post/#{@post.id}@bloccit-mich.com>"
    headers["References"] = "<post/#{@post.id}@bloccit-mich.com>"

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end

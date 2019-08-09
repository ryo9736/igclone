class PostMailer < ApplicationMailer
    def post_mailer(post)
        @post = post
        mail to: "domdomgangan@gmail.com", subject: "picture confirm"
    end
end

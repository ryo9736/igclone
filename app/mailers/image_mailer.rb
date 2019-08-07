class ImageMailer < ApplicationMailer
    def image_mailer(image)
        @image = image
        mail to: @image.user.email, subject: "画像投稿確認メール", layout: 'image_mailer'
    end
end

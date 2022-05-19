class UserMailer < ApplicationMailer
    default from: "notifications@rent-a-cat.com"

    def welcome_email(user)
        @user = user
        @url = "https://localhost:3000/session/new"

        mail(to: @user.username, subject: "Welcome to Rent-A-Cat")
    end

end

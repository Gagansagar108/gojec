class UsersController < ApplicationController
    skip_before_action :authenticate, only: [:sign_up]
    def login

        
    end 

    def sign_up
        user = User.new(user_sign_up_params)

        unless user.save 
            return render jsnon: {"message": "something went wrong" }
        end 

        create_session
    end 

    private 

    def user_sign_up_params
        params.require(:name, :email, :password).permit(:name, :email, :password)
    end 

    def create_session(user)
        user.user_sessions.create!(status: true, key: SecureRandom.uuid)
    end 
end 
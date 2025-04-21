class UsersController < ApplicationController
    skip_before_action :authenticate, only: [:sign_up]
    def login
        email = params[:email]
        passoword =  params[:passoword]
        user = User.where(email: email)


        if user.blank?
            return render json: {"message": 'user does not exists'}, status: 401
        end 


        if Bcrypt(passoword) != user.encrypted_password
            return render json: {"message": 'incorrect password'}, status: 401
        end 

        create_session(user)


        return success_reponse 
    end 

    def sign_up
        user = User.new(user_sign_up_params)

        unless user.save 
            return render jsnon: {"message": "something went wrong" }
        end 

        create_session(user)
    end 

    

    private 

    def user_sign_up_params
        params.require(:name, :email, :password).permit(:name, :email, :password)
    end 

    def create_session(user)
        user.user_sessions.create!(status: true, key: SecureRandom.uuid)
    end 
end 
class ApplicationController < ActionController::API
    before_action :authenticate 


    def authenticate
        email = params[:email]
        passoword =  params[:passoword]
        user = User.where(email: email)


        if user.blank?
            return render json: {"message": 'user does not exists'}, status: 401
        end 


        if Bcrypt(passoword) != user.encrypted_password
            return render json: {"message": 'incorrect password'}, status: 401
        end 
    end
end

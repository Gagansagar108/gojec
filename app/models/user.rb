class User < ApplicationRecord

    has_many :user_sessions

    has_secure_password
    

end
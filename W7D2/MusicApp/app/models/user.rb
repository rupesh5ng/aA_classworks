class User < ApplicationRecord
    validates :email , presence: true ,uniqueness: true
    validates :password_digest , presence: true 
    validates :session_token ,presence: true , uniqueness: true
    validates :password ,length: { minimum: 6 }, allow_nil: true 

    after_initialize :ensure_session_token 
    
    attr_reader :password
    #S.P.I.R.E.
    def self.find_by_credentials(email,password)
        email = User.find_by(email: email) # actors: { name: name}
        if email && email.is_password?(password)
            email
        else
           nil 
        end
    end

    def password=(password)
         self.password_digest = BCrypt::Password.create(password)
         @password = password 
    end

    def is_password?(pw)
        BCrypt::Password.new(self.password_digest).is_password?(pw)
    end

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64 
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64 
    end

end

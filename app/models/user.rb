class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true

    has_secure_password
    
    has_many :comments
    has_many :boards, dependent: :destroy
end

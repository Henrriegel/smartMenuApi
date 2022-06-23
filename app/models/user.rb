class User < ApplicationRecord
    enum role: {Administrator: "Administrator", User: "User"}
    validates :name, presence: true
    validates :cellphone, presence: true
    validates :email, presence: true
    validates :password, presence: true
    validates :role, presence: true
end

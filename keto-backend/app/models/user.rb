class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist
end

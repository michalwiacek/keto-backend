# frozen_string_literal: true

class User < ApplicationRecord
  rolify

  after_initialize :set_default_role, if: :new_record?

  has_one_attached :avatar

  has_many :articles, dependent: :destroy

  devise :database_authenticatable,
         :registerable,
         :lockable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         :confirmable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtBlacklist

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: Devise.email_regexp }
  validates :roles, presence: true

  def set_default_role
    add_role(:normal)
  end

  def name
    "#{first_name} #{last_name}"
  end
end

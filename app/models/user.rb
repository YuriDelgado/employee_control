class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :invitable, :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :invitable,
          invite_for: 2.weeks
end

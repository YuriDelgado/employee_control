class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :employees, class_name: "User",
          foreign_key: "admin_id"
  belongs_to :admin, class_name: "User",
          optional: true

  devise  :invitable, :database_authenticatable,
          :registerable, :recoverable, :rememberable, 
          :validatable, :invitable, invite_for: 2.weeks

  validates_confirmation_of :password

  def admin?
    admin.nil?
  end
end
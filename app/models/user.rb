class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_one_attached :avatar
  belongs_to :role

  before_save :assign_role

  def assign_role
    self.role = Role.find_by name: 'Operator' if role.nil?
  end

  def is_admin?
    self.role.name == 'Admin'
  end

  def is_manager?
    self.role.name == 'Manager'
  end
end

class User < ApplicationRecord
  enum role: [:admin, :manager, :operator]
  after_initialize :set_default_role, :if => :new_record?
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_one_attached :avatar
  has_many :articles

  def set_default_role
    self.role ||= :operator
  end
end

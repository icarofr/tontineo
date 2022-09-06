class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :owned_tontines, class_name: 'Tontine', foreign_key: :user_id
  has_many :members
  has_many :tontines, through: :members, source: :tontine

  has_one_attached :photo

  def full_name
    [first_name, last_name].map(&:capitalize).join(" ")
  end
end

class Tontine < ApplicationRecord
  belongs_to :user
  has_many :members
  has_many :users, through: :members

  has_one_attached :cover
  STATUS = %w[pending  active done]
  validates :status, inclusion: { in: Tontine::STATUS }
end

class Tontine < ApplicationRecord
  belongs_to :user
  has_many :members
  has_many :messages
  STATUS = %w[pending  active done]
  validates :status, inclusion: { in: Tontine::STATUS }
end

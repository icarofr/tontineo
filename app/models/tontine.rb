class Tontine < ApplicationRecord
  belongs_to :user
  has_many :members
  STATUS = %w[pending  active done]
  validates :status, inclusion: { in: Tontine::STATUS }
end

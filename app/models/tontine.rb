class Tontine < ApplicationRecord
  belongs_to :user
  STATUS = %w[pending  active done]
  validates :status, inclusion: { in: Tontine::STATUS }
end

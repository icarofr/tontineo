class Member < ApplicationRecord
  belongs_to :tontine
  belongs_to :user
  STATUS_MEMBERS %w[pending  accepted decline]
end


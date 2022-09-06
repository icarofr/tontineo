class Member < ApplicationRecord
  belongs_to :tontine
  belongs_to :user

  validates :user_id, uniqueness: { scope: :tontine_id }
end

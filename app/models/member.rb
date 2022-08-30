class Member < ApplicationRecord
  belongs_to :tontine_id
  belongs_to :user_id
end

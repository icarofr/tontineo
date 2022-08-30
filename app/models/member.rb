class Member < ApplicationRecord
  belongs_to :tontine
  belongs_to :user
end

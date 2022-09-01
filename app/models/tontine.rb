class Tontine < ApplicationRecord
  belongs_to :user
  has_many :members
end

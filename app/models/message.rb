class Message < ApplicationRecord
  belongs_to :user
  belongs_to :tontine_id
end

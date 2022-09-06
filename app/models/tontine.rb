class Tontine < ApplicationRecord
  belongs_to :user
  has_many :messages
  has_many :members, -> { order(position: :asc) }, dependent: :destroy
  has_many :users, -> { order("members.position ASC") }, through: :members

  has_one_attached :cover
  
  STATUS = %w[pending  active done]
  validates :status, inclusion: { in: Tontine::STATUS }

  after_create :create_first_member

  def current_position
    Date.today.month - self.start_month.month + 1
  end

  private

  def create_first_member
    Member.create(user: self.user, tontine: self, status: "confirmed", position: 1)
  end
end

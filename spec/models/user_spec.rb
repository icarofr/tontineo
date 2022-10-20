require 'rails_helper'

RSpec.describe User, type: :model do
  it 'full_name returns the capitalize first_name and last_name' do
    user = User.new(first_name: "john", last_name: 'lennon')
    expect(user.full_name).to eql "John Lennon"
  end
end

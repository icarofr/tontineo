require 'rails_helper'

RSpec.describe Tontine, type: :model do
  it 'returns name for a tontine' do
    tontine = Tontine.create(name: "congo")
    expect(tontine.name).to eq 'congo'
  end

  it 'check if participants is type integer' do
      tontine = Tontine.create(participants: 5 )
      expect(tontine.participants).to be(5)
  end
end

require 'rails_helper'

RSpec.describe Tontine, type: :model do
  subject {
    tontine = Tontine.create!(name: "Voiture",
      contribution: 300, 
      start_month: start_month, 
      payment_day: 25, participants: 5, 
      status: "active", user: jean)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a contribution" do
    subject.contribution = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a start_month" do
    subject.start_month = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a payment_day" do
    subject.payment_day = nil
    expect(subject).to_not be_valid
  end

end


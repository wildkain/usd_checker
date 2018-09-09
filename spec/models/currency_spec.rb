require 'rails_helper'

RSpec.describe Currency, type: :model do
  it { should validate_presence_of :value}

  it 'validate date(past - not valid)' do
    currency = Currency.new(to: Time.zone.now - 1.day)
    expect{currency.save }.to_not change(Currency, :count)
  end
end

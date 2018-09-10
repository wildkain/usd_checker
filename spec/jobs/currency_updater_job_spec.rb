require 'rails_helper'

RSpec.describe CurrencyUpdaterJob, type: :job do
  it 'update currency' do
    expect(Currency).to receive(:current)
    CurrencyUpdaterJob.perform_now
  end

end

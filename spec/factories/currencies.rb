FactoryBot.define do
  factory :currency do
    value 123.0
    to Time.zone.now + 2.hours
  end

  factory :invalid_currency, class: "Currency" do
    value nil
    to nil
  end
end

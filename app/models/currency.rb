class Currency < ApplicationRecord
  validates_presence_of :value
  validate :date_check

  def self.current
    if where('"to" > ?', Time.zone.now).exists?
      last
    else
      new(value: current_currency)
    end
  end

  private

  def date_check
    if self.to.present? && self.to < Time.zone.now
      errors.add(:to, "Cannot setup value in the past")
    end
  end

  def self.current_currency
    CurrencyParserService.new.result
  end
end

class Currency < ApplicationRecord
  validates_presence_of :value
  validate :date_check

  def self.current
    Currency.last
  end


  private

  def date_check
    if self.to.present? && self.to < Time.zone.now
      errors.add(:to, "Cannot setup value in the past")
    end
  end
end

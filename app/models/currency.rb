class Currency < ApplicationRecord

  def self.current
    Currency.last
  end
end

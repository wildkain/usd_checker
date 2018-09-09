class CurrencyUpdaterJob < ApplicationJob
  queue_as :default

  def perform
    view = ApplicationController.renderer.render(Currency.current)
    ActionCable.server.broadcast 'currencies', view
  end
end

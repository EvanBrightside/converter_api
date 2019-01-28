class StoreCoinsJob < ApplicationJob
  queue_as :default

  def perform
    CoinMarketCapService.new.full_data
  end
end

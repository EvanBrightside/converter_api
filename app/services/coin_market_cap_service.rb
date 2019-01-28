class CoinMarketCapService
  include HTTParty
  base_uri 'api.coinmarketcap.com/v1/ticker'

  def full_data
    data = self.class.get('/')

    return if data.empty?

    store_coins(data)
  end

  private

  def store_coins(data)
    data.map do |coin|
      Coin.where(
        cmc_id: coin['id'],
        name: coin['name'],
        symbol: coin['symbol']
      ).first_or_initialize.update(
        price_usd: coin['price_usd'],
        price_btc: coin['price_btc']
      )
    end
  end
end

# CoinMarketCapService.new.full_data

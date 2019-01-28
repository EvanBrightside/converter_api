class ExchangeCalculator
  def initialize(params)
    @from_coin = params['from_coin']
    @to_coin = params['to_coin']
    @amount = params['amount'].to_f
  end

  def call
    exchange(@amount, @from_coin, @to_coin)
  end

  private

  def exchange(amount, from_coin, to_coin)
    coin = Coin.where(symbol: to_coin).first

    return if coin.nil?

    coin_price = coin&.price_btc&.to_f
    result = (amount / coin_price).round(4)
    data = {
      from_coin: from_coin,
      to_coin: to_coin,
      amount: amount,
      result: result
    }
    store_exchanges(data)
  end

  def store_exchanges(data)
    Exchange.create!(
      from_coin: data[:from_coin],
      to_coin: data[:to_coin],
      amount: data[:amount],
      result: data[:result]
    )
  end
end

#ExchangeCalculator.new('BTC', 'ETH', 1.1).call

CoinMarketCapService.new.full_data

Coin.pluck(:symbol).sample(13).map do |elem|
  ExchangeCalculator.new(
    'from_coin' => 'BTC',
    'to_coin' => elem,
    'amount' => '2'
  ).call
end

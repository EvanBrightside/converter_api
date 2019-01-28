FactoryBot.define do
  factory :coin do
    cmc_id { 'ethereum' }
    name { 'Ethereum' }
    symbol { 'ETH' }
    price_usd { '104.397558781' }
    price_btc { '0.03021714' }
  end
end

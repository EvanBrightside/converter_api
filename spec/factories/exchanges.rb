FactoryBot.define do
  factory :exchange do
    from_coin { 'BTC' }
    to_coin { 'ETH' }
    amount { '2' }
    result { '64.919' }
  end
end

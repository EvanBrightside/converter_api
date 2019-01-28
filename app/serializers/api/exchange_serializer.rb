class Api::ExchangeSerializer < ActiveModel::Serializer
  attributes :from_coin, :to_coin, :amount, :result, :exchange_time

  def exchange_time
    object.created_at.strftime('%d/%m/%Y')
  end
end

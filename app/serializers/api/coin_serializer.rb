class Api::CoinSerializer < ActiveModel::Serializer
  attributes :name, :symbol
end

class Api::CoinsController < Api::BaseController
  # api :GET, 'http://localhost:3000/api/coins'
  def index
    coins = Coin.all

    render json: coins
  end
end

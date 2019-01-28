class Api::ExchangesController < Api::BaseController
  skip_before_action :verify_authenticity_token
  # api :GET, 'http://localhost:3000/api/exchanges'
  def index
    exchanges = Exchange.last(10)

    render json: exchanges.reverse
  end

  # api :POST, 'http://localhost:3000/api/exchanges?from_coin=BTC&to_coin=ETH&amount=11'
  def create
    exchange = ExchangeCalculator.new(exchange_params).call
    if exchange.save
      render json: {
        status: 201,
        result: exchange.result.to_s + ' ' + exchange.to_coin
      }.to_json
    else
      respond_with exchange
    end
  end

  private

  def exchange_params
    params.permit(:from_coin, :to_coin, :amount)
  end
end

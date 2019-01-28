require 'swagger_helper'
require 'rails_helper'

describe 'Exchanges API' do

  path '/api/exchanges' do

    post 'Create an exchange' do
      tags 'Exchanges'
      consumes 'application/json', 'application/xml'
      parameter name: :exchange, in: :body, schema: {
        type: :object,
        properties: {
          from_coin: { type: :string },
          to_coin: { type: :string },
          amount: { type: :string }
        },
        required: %w[from_coin to_coin amuont]
      }

      describe '#create' do
        let!(:coin) { FactoryBot.create(:coin) }

        response '201', 'exchange created' do
          let(:exchange) { { from_coin: 'BTC', to_coin: 'ETH', amount: '3.2' } }
          run_test!
        end
      end
    end

    get 'Get last 10 exchanges' do
      tags 'Exchanges'
      produces 'application/json', 'application/xml'

      describe '#index' do
        let!(:exchange) { FactoryBot.create(:exchange) }

        subject { response }

        response '200', 'last 10 exchanges' do
          it { is_expected.to be_success }
          run_test!
        end
      end
    end
  end
end

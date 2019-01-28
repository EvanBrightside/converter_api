require 'swagger_helper'
require 'rails_helper'

describe 'Coins API' do

  path '/api/coins' do

    get 'Get all coins' do
      tags 'Coins'
      produces 'application/json', 'application/xml'

      describe '#index' do
        let!(:coin) { FactoryBot.create(:coin) }

        subject { response }

        response '200', 'get all coinss' do
          it { is_expected.to be_success }
          run_test!
        end
      end
    end
  end
end

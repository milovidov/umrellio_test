require 'rails_helper'

RSpec.describe 'Tops API', type: :request do

  describe 'GET /tops' do
    let(:valid_attributes) {{limit: 10}}

    context 'when the request is not valid' do

      it 'invalid empty limit and returns status code 422' do
        get '/tops'
        expect(response).to have_http_status(422)
      end

    end
  end
end

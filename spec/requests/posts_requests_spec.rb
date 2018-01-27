require 'rails_helper'

RSpec.describe 'Posts API', type: :request do

  describe 'POST /posts' do
    let(:valid_attributes) { { login: 'User1', title: 'title1', body: 'Test body', ip: '192.168.1.1' } }
    let(:not_valid_attributes) { { title: 'title1', body: 'Test body'} }

    context 'when the request is valid' do
      before {post '/posts', params: valid_attributes}

      it 'creates a post' do
        expect(response).to have_http_status(201)

        expect(json['title']).to eq(valid_attributes[:title])
        expect(json['body']).to eq(valid_attributes[:body])
        expect(json['ip']).to eq(valid_attributes[:ip])
      end
    end

    context 'when the request is valid' do
      before {post '/posts', params: not_valid_attributes}

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

end

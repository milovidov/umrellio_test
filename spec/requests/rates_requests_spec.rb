require 'rails_helper'

RSpec.describe 'Rates API', type: :request do

  describe 'PUT /rates' do
    let(:valid_attributes) {{rate: 3.1}}
    let(:valid_attributes2) {{rate: 5}}
    let(:not_valid_attributes) {{rate: 6.0}}
    let(:not_valid_attributes2) {{}}

    let(:valid_post_attributes) { { login: 'User1', title: 'title1', body: 'Test body', ip: '192.168.1.1' } }

    before do
      post '/posts', params: valid_post_attributes
      @post_id  = Post.first[:id]
    end

    context 'when the request is valid' do
      before do
        put "/rates/#{@post_id}", params: valid_attributes
        put "/rates/#{@post_id}", params: valid_attributes2
      end

      it 'creates a post' do
        expect(response).to have_http_status(201)

        expect(json['post_id']).to eq(@post_id)
        expect(json['rate']).to eq((valid_attributes[:rate] + valid_attributes2[:rate]) / 2)
      end
    end

    context 'when the request is not valid' do

      it 'invalid rate and returns status code 422' do
        put "/rates/#{@post_id}", params: not_valid_attributes
        expect(response).to have_http_status(422)
      end

      it 'empty rate and returns status code 422' do
        put "/rates/#{@post_id}", params: not_valid_attributes2
        expect(response).to have_http_status(422)
      end
    end
  end
end

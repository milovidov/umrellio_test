require 'rails_helper'

RSpec.describe Rate, type: :model do

  it { should validate_presence_of(:post_id) }
  it { should validate_presence_of(:count) }
  it { should validate_presence_of(:rate) }
end
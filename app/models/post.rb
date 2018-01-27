class Post < ApplicationRecord
  belongs_to :user
  has_one :rate, dependent: :destroy


  validates_presence_of :user_id, :title, :body, :ip
end

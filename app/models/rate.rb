class Rate < ApplicationRecord
  validates_presence_of :post_id, :count, :rate

end

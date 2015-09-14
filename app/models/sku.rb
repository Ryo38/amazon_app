class Sku < ActiveRecord::Base
  belongs_to :user
  has_one :asin
end

class Product < ApplicationRecord
    has_one_attached :image
    validates :name, :price, :description, presence: true
  end
  
class Category < ApplicationRecord
  has_many :books, dependent: :destroy

  scope :find_category, -> search_name {where(name: search_name)}
end

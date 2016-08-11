class Book < ApplicationRecord
  belongs_to :category

  has_many :userbooks, dependent: :destroy
  has_many :reviews

  validates :title, presence: true, length: {maximum: 100}
  validates :author, presence: true
  validates :picture, presence: true
  validates :category, presence: true
  validates :publish_date, presence: true
  validates :number_of_page, presence: true, numericality: true

  enum filter: [:title, :category]

  scope :search_book_by_title,
    -> search_name {where("title like '%#{search_name}%'")}
  scope :search_book_by_category,
    -> category_id {where category_id: category_id}
end

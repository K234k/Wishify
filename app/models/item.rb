class Item < ApplicationRecord
 belongs_to :category, class_name: 'Category', foreign_key: 'category_id'

  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :category_id, presence: true, inclusion: { in: Category.pluck(:id) }
end

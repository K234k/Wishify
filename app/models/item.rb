class Item < ApplicationRecord
 belongs_to :Category

  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :category_id, presence: true, inclusion: { in: Category.pluck(:id) }
end

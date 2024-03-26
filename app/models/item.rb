class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :category, presence: true, inclusion: { in: ['メンズ', 'レディース', 'ベビー・キッズ', 'インテリア・住まい・小物', '本・音楽・ゲーム', 'おもちゃ・ホビー・グッズ', '家電・スマホ・カメラ', 'スポーツ・レジャー', 'ハンドメイド', 'その他'] }
end
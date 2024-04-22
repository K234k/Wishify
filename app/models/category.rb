class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: 'ファッション' },
    { id: 2, name: '電化製品' },
    { id: 3, name: '家具・インテリア' },
    { id: 4, name: '本・雑誌' },
    { id: 5, name: '音楽・映画' },
    { id: 6, name: 'ゲーム・おもちゃ' },
    { id: 7, name: 'スポーツ・アウトドア' },
    { id: 8, name: '趣味・コレクション' },
    { id: 9, name: '美容・コスメ' },
    { id: 10, name: '食品・飲料' },
    { id: 11, name: '日用品・生活雑貨' },
    { id: 12, name: 'キッチン用品' },
    { id: 13, name: 'ペット用品' },
    { id: 14, name: 'ベビー・キッズ' },
    { id: 15, name: '車・バイク' },
    { id: 16, name: '工具・DIY' },
    { id: 17, name: '文房具・オフィス用品' },
    { id: 18, name: 'パソコン・周辺機器' },
    { id: 19, name: 'スマートフォン・アクセサリー' },
    { id: 20, name: 'カメラ・ビデオカメラ' },
    { id: 21, name: '健康・医療用品' },
    { id: 22, name: '旅行用品' },
    { id: 23, name: 'ガーデニング' },
    { id: 24, name: '手芸・ハンドメイド' },
    { id: 25, name: '学習・教育' },
    { id: 26, name: 'チケット・金券' },
    { id: 27, name: 'ビジネス・産業' },
    { id: 28, name: 'サービス・リペア' },
    { id: 29, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end


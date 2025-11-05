# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# 開発用サンプル商品データ
# 開発環境の商品データ

Product.destroy_all  # 開発用：過去データ削除

items = [
  { name: "魔法の杖", price: 1200, stock: 5, rarity: 2, description: "初心者向けの杖。扱いやすく軽い。", image: "wand.jpg" },
  { name: "火炎の指輪", price: 3000, stock: 3, rarity: 3, description: "炎の魔力を宿した指輪。攻撃力を上げる。", image: "ring.jpg" },
  { name: "回復ポーション", price: 800, stock: 10, rarity: 1, description: "HPを少し回復するポーション。", image: "potion.jpg" }
]

items.each do |item|
  product = Product.create!(
    name: item[:name],
    price: item[:price],
    stock: item[:stock],
    rarity: item[:rarity],
    description: item[:description]
  )

  # ← この行はRubyの中で動くコード！
  image_path = Rails.root.join("app/assets/images/products/#{item[:image]}")

  if File.exist?(image_path)
    product.image.attach(io: File.open(image_path), filename: item[:image])
  else
    puts "⚠️ 画像が見つかりません: #{image_path}"
  end
end

puts "✅ #{Product.count}件の商品を登録しました！"

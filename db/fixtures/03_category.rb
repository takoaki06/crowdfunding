names = ["ファッション","音楽","ビジネス","スポーツ","地域"]

5.times do |index|
  Category.seed(:id,
    {
      name: "#{names[index]}"
    }
  )
end
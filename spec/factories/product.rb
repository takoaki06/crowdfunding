FactoryBot.define do
  factory :product do
    title {"テストを書く"}
    desc {"Rspec & Capybara & FactoryBotを準備する"}
    price { 10000 }
    # association :user, factory: :user
  end
end
FactoryBot.define do
  factory :user do
    name {"name"}
    email {"test#{rand(10000)}@gmail.com"}
    password {"takasasaki"}
  end
end

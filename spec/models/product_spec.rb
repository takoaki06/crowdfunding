require 'rails_helper'

RSpec.describe "Product", type: :model do
  describe "#owner?" do
    context "Productの所有者の場合" do
      let!(:owner) { FactoryBot.create(:user) }
      let!(:product) { FactoryBot.create(:product, user: owner) }

      it 'trueを返すこと' do
        expect(product.owner?(owner)).to be true
      end
    end

    context "Productの所有者でない場合" do
      let!(:user) { FactoryBot.create(:user) }
      let!(:owner) { FactoryBot.create(:user) }
      let!(:product) { FactoryBot.create(:product, user: owner) }
  
      it 'falseを返すこと' do
        expect(product.owner?(user)).to be false
      end
    end
  end

  describe "#already_liked?" do
    context '自身のlikeが存在する場合' do
      let!(:user) { FactoryBot.create(:user) }
      let!(:product) { FactoryBot.create(:product, user: user) }
      let!(:like) { FactoryBot.create(:like, product: product, user: user) }

      it 'trueを返すこと' do
        expect(product.already_liked?(user)).to be true
      end
    end

    context '自身のlikeが存在しない場合' do
      let!(:user) { FactoryBot.create(:user) }
      let!(:product) { FactoryBot.create(:product, user: user) }

      it 'falseを返すこと' do
        expect(product.already_liked?(user)).to be false
      end
    end

    context '自身のlikeが存在しないかつ自分以外のlikeが存在している場合' do
      let!(:user) { FactoryBot.create(:user) }
      let!(:product) { FactoryBot.create(:product, user: user) }

      let!(:unlike_user) { FactoryBot.create(:user) }
      let!(:like) { FactoryBot.create(:like, product: product, user: unlike_user) }

      it 'falseを返すこと' do
        expect(product.already_liked?(user)).to be false
      end
    end

  end
end
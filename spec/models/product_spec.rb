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

    context "Productの所有者の場合" do
      let!(:user) { FactoryBot.create(:user) }
      let!(:owner) { FactoryBot.create(:user) }
      let!(:product) { FactoryBot.create(:product, user: owner) }
  
      it 'falseを返すこと' do
        expect(product.owner?(user)).to be false
      end
    end
  end

  describe "#valid?" do
    it 'データが正しければtrueを返すこと' do
      user = FactoryBot.create(:user)
      product = FactoryBot.build(:product, user: user)

      expect(product.valid?).to be true
    end

    it 'データが正しくなければfalseを返すこと' do
      product = FactoryBot.build(:product)
      expect(product.valid?).to be false
    end

  end

  describe "#already_liked?" do
    context 'すでにlikeしている場合' do
      let!(:user) { FactoryBot.create(:user) }
      let!(:product) { FactoryBot.create(:product, user: user) }
      let!(:like) { FactoryBot.create(:like, product: product, user: user) }

      it 'trueを返すこと' do
        expect(product.already_liked?(user)).to be true
      end
    end

    context 'likeしていない場合' do
      let!(:user) { FactoryBot.create(:user) }
      let!(:product) { FactoryBot.create(:product, user: user) }

      it 'falseを返すこと' do
        expect(product.already_liked?(user)).to be false
      end
    end

    context '自分以外のlikeが存在する場合' do
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
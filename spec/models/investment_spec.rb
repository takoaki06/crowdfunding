require 'rails_helper'

RSpec.describe "Investment", type: :model do

  describe "#investable?" do
    context '出資の合計が目標額に達していない場合' do
      let!(:user) { FactoryBot.create(:user) }
      let!(:product) { FactoryBot.create(:product, user: user) }
      let!(:investment) { FactoryBot.create(:investment, user: user, product: product) }

      it 'trueを返すこと' do
        expect(Investment.investable?(product)).to be true
      end
    end

    context '出資の合計が目標額に達している場合' do
      let!(:user) { FactoryBot.create(:user) }
      let!(:product) { FactoryBot.create(:product, user: user) }
      let!(:investment) { FactoryBot.create(:investment, user: user, product: product, price: 100000) }

      it 'falseを返すこと' do
        expect(Investment.investable?(product)).to be false
      end
    end
  end

  describe "#exceed?" do
    context '出資が目標額に達していない場合' do
      let!(:user) { FactoryBot.create(:user) }
      let!(:product) { FactoryBot.create(:product, user: user) }
      let!(:investment) { FactoryBot.create(:investment, user: user, product: product) }

      it 'trueを返すこと' do
        expect(investment.exceed?).to be true
      end
    end

    context '出資が目標額に達している場合' do
      let!(:user) { FactoryBot.create(:user) }
      let!(:product) { FactoryBot.create(:product, user: user) }
      let!(:investment) { FactoryBot.create(:investment, user: user, product: product, price: 200000) }

      it 'falseを返すこと' do
        expect(investment.exceed?).to be false
      end
    end
  end

end
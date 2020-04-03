require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    context 'メッセージが保存できる場合' do
      it 'メッセージがあれば保存できる' do
        expect(build(:message, image: nil)).to be_valid
      end

      it 'イメージがあれば保存できる' do
        expect(build(:message, body: nil)).to be_valid
      end

      it 'メッセージもイメージもあると保存できる' do
        expect(build(:message)).to be_valid
      end
    end

    context 'メッセージが保存できない場合' do
      it 'メッセージもイメージも無いからNG' do
        message = build(:message, body: nil, image: nil)
        message.valid?
        expect(message.errors[:body]).to include("を入力してください")
      end

      it 'group_idが無いとNG' do
        message = build(:message, group_id: nil)
        message.valid?
        expect(message.errors[:group]).to include("を入力してください")
      end

      it 'user_idが無いとNG' do
        message = build(:message, user_id: nil)
        message.valid?
        expect(message.errors[:user]).to include("を入力してください")
      end
    end
  end
end
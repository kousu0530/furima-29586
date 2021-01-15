require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FActoryBot.build(:user)
  end
  pending "add some examples to (or delete) #{__FILE__}"

  it 'password:半角英数混合(半角英語のみ)' do
    @user.password = 'aaaaaaa'
    @user.valid?
    binding.pry
    expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
  end
end

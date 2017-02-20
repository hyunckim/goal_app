# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }

  subject(:user) { User.create(username: "Hyun", password: "password123") }

  describe '::find_by-credentials' do



    it 'returns the user with valid credentials' do
      expect(User.find_by_credentials("Hyun","password123")).to eq(User.find_by_username("Hyun"))
    end

    it 'returns nil with invalid credentials' do
      expect(User.find_by_credentials("Hyun","password")).to eq(nil)
    end
  end

  describe '#reset_session_token' do
    it 'resets user session_token' do
      current_session_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).to_not eq(current_session_token)
    end
  end

end

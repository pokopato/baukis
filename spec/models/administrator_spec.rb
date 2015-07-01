require 'rails_helper'

RSpec.describe Administrator, :type => :model do
  describe '#password=' do
    example '文字列を与えると、hashed_passwordは長さ60の文字列になる' do
      admin = Administrator.new
      admin.password = 'foobar'
      
      expect(admin.hashed_password.size).to eq(60)
    end
  end
end

require 'spec_helper'

describe OmniAuth::Strategies::EmpireAvenue do
  subject do
    OmniAuth::Strategies::EmpireAvenue.new(nil, @options || {})
  end

  describe '#client' do
    it 'should have the correct Empire Avenue site' do
      subject.client.site.should eq("https://www.empireavenue.com")
    end

    it 'should have the correct authorization url' do
      subject.client.options[:authorize_url].should eq("https://www.empireavenue.com/profile/developer/authorize")
    end

    it 'should have the correct token url' do
      subject.client.options[:token_url].should eq('https://api.empireavenue.com/oauth/token')
    end
  end

  describe '#callback_path' do
    it 'should have the correct callback path' do
      subject.callback_path.should eq('/auth/empireavenue/callback')
    end
  end
end

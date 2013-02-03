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

  describe '#uid' do
    it 'returns the uid from raw_info' do
      subject.stub(:raw_info) { { 'ticker' => 'txwikinger' } }
      subject.uid.should == 'txwikinger'
    end
  end

  describe '#first_name' do
    it 'returns the name from raw_info' do
      subject.stub(:raw_info) { { 'first_name' => 'Bert' }}
      subject.info[:first_name].should == 'Bert'
    end

    it 'returns the last_name from raw_info' do
      subject.stub(:raw_info) { { 'last_name' => 'Vogts' }}
      subject.info[:last_name].should == 'Vogts'
    end

    it 'returns the full name from raw_info' do
      subject.stub(:raw_info) { { 'full_name' => 'Berti Vogts' }}
      subject.info[:full_name].should == 'Berti Vogts'
    end

  end
end

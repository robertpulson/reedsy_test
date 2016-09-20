require 'rails_helper'

describe Activity do
  context 'Creating' do
    it 'has a valid factory' do
      a = FactoryGirl.create(:activity)
      expect(a).to be_valid
    end

    it 'is invalid without an actor' do
      a = FactoryGirl.build(:activity, actor: nil)
      expect(a).not_to be_valid
    end

    it 'is invalid without a item' do
      a = FactoryGirl.build(:activity, item: nil)
      expect(a).not_to be_valid
    end

    it 'is invalid without a action' do
      a = FactoryGirl.build(:activity, action: nil)
      expect(a).not_to be_valid
    end

    it 'is invalid with invalid items' do
      a = FactoryGirl.build(:activity, item: 'fishing')
      expect(a).not_to be_valid
    end
    
    it 'is invalid with invalid actions' do
      a = FactoryGirl.build(:activity, action: 'fish')
      expect(a).not_to be_valid
    end
  end

  context 'Methods' do
    it 'returns an activity string' do
      a = FactoryGirl.create(:activity)
      expect(a.activity_string).to eq('Phil Brockwell found a new job')
    end

    it 'returns a time string' do
      t = Time.now()
      a = FactoryGirl.create(:activity)
      expect(a.time_string).to eq(t.strftime("%d %b. %Y"))
    end
  end
end

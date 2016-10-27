require 'rails_helper'

RSpec.describe Kind, type: :model do
  describe 'validations' do
    it 'must have a name' do
      k = build :kind, name: nil
      k.valid?
      expect(k.errors).to have_key(:name)
    end
    it 'must have a unique name' do
      create :kind, name: 'Steve'
      k = build :kind, name: 'Steve'
      k.valid?
      expect(k.errors).to have_key(:name)
    end
  end
end

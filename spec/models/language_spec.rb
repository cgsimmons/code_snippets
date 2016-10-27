require 'rails_helper'

RSpec.describe Language, type: :model do
  describe 'validations' do
    it 'must have a name' do
      k = build :language, name: nil
      k.valid?
      expect(k.errors).to have_key(:name)
    end
    it 'must have a unique name' do
      create :language, name: 'Steve'
      k = build :language, name: 'Steve'
      k.valid?
      expect(k.errors).to have_key(:name)
    end
  end
end

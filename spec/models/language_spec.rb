require 'rails_helper'

RSpec.describe Language, type: :model do
  describe 'validations' do
    it 'must have a name' do
      l = build :language, name: nil
      l.valid?
      expect(l.errors).to have_key(:name)
    end
    it 'must have a unique name' do
      create :language, name: 'Steve'
      l = build :language, name: 'Steve'
      l.valid?
      expect(l.errors).to have_key(:name)
    end
  end
end

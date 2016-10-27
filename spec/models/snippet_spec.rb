require 'rails_helper'

RSpec.describe Snippet, type: :model do
  describe 'validates' do
    it 'requires title' do
      s = build :snippet, title: nil
      s.valid?
      expect(s.errors).to have_key(:title)
    end
    it 'requires work' do
      s = build :snippet, work: nil
      s.valid?
      expect(s.errors).to have_key(:work)
    end
  end
end

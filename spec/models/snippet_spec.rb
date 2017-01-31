require 'rails_helper'

RSpec.describe Snippet, type: :model do
  describe 'validates' do
    it 'requires title' do
      s = build :snippet, title: nil
      s.valid?
      expect(s.errors).to have_key(:title)
    end
    it 'requires code' do
      s = build :snippet, code: nil
      s.valid?
      expect(s.errors).to have_key(:code)
    end
    it 'requires language' do
      s = build :snippet, language: nil
      s.valid?
      expect(s.errors).to have_key(:language)
    end
  end

  describe 'methods' do
    context 'search'
      it 'returns correct search' do
        5.times do |i|
          create :snippet, title: "hello#{i}", code:"bananas#{i}"
        end
        result = Snippet.search("hello3").first
        expect(result.title).to eq("hello3")
      end
  end
end

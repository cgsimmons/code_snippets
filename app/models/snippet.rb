class Snippet < ApplicationRecord
  belongs_to :language
  belongs_to :user

  validates :title, presence: true
  validates :code, presence: true

  def self.search(search_str)
    where("title ILIKE ? OR code ILIKE ?", "%#{search_str}%", "%#{search_str}%")
  end
end

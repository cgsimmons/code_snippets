class Snippet < ApplicationRecord
  belongs_to :language

  validates :title, presence: true
  validates :work, presence: true

  def self.search(search_str)
    where("title ILIKE ? OR work ILIKE ?", "%#{search_str}%", "%#{search_str}%")
  end
end

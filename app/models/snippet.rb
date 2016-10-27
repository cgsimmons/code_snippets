class Snippet < ApplicationRecord
  belongs_to :language

  validates :title, presence: true
  validates :work, presence: true
end

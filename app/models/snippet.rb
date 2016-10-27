class Snippet < ApplicationRecord
  belongs_to :kind

  validates :title, presence: true
  validates :work, presence: true
end

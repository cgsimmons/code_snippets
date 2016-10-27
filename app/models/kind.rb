class Kind < ApplicationRecord
  has_many :snippets, dependent: :destroy

  validates :name, presence: true, uniqueness: true

end

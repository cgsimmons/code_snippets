class Kind < ApplicationRecord
  has_many :snippets, dependent: :destroy

  
end

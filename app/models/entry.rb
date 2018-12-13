class Entry < ApplicationRecord
  belongs_to :blog
  has_many :comment
end

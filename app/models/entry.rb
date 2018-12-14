class Entry < ApplicationRecord
  belongs_to :blog
  has_many :comment

  validates :title, presence: true
  validates :body, presence: true
end

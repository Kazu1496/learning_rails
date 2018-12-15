class Entry < ApplicationRecord
  belongs_to :blog, optional: true
  has_many :comment

  validates :title, presence: true
  validates :body, presence: true
end

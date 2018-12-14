class Blog < ApplicationRecord
  has_many :entry

  validates :title, presence: true

end

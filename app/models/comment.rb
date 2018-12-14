class Comment < ApplicationRecord
  belongs_to :entry

  validates :body, presence: true
  validates :status, presence: true

  def toggle_status!
    if self.status === 'approved'
      self.status = 'unapproved'
    else
      self.status = 'approved'
    end
    self.save
  end

end

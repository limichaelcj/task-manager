class Task < ApplicationRecord
  before_save :default_values

  validates :title, presence: true

  def default_values
    self.details = 'No details.' if self.details == ""
    self.completed ||= false
  end
end

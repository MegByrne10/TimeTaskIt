class SubTask < ActiveRecord::Base
  belongs_to :task

  validates :description, length: { maximum: 20 }, presence: true
end

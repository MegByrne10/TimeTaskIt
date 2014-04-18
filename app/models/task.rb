class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :list
  has_many :sub_tasks, dependent: :destroy
  
  validates :description, length: { maximum: 140 }, presence: true
  validates :time_goal, presence: true
  validates :list, presence: true
  validates :user, presence: true
end

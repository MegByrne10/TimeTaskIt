class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :list
  has_many :sub_tasks, dependent: :destroy

  scope :almost_due, -> { where("time_goal < ?", Time.now + 10.days).order('time_goal asc') }
  default_scope { order('time_goal asc') }
  
  validates :description, length: { maximum: 140 }, presence: true
  validates :time_goal, presence: true
  validates :list, presence: true
  validates :user, presence: true
end

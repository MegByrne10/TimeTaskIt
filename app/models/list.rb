class List < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :title, length: { maximum: 20 }, presence: true
  validates_presence_of :user
end

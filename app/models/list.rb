class List < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :title, length: { maximum: 20 }, presence: true
end

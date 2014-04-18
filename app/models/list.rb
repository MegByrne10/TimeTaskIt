class List < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :title, length: { maximum: 40 }, presence: true
  validates_presence_of :user

  scope :title, -> { order('created_at desc') }
end

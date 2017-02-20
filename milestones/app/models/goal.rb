class Goal < ActiveRecord::Base
  validates :user, :title, :description, presence: true

  belongs_to :user
end

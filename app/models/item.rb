class Item < ActiveRecord::Base
  belongs_to :category
  has_many :comments
   has_many :users, through: :comments

  validates :category, presence: true
  validates :name, presence: true
  validates :identifier, presence: true

end

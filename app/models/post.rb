class Post < ActiveRecord::Base
  has_many :comments
  has_many :postvotes
  belongs_to :user

  validates :title, :content, :presence => true

end

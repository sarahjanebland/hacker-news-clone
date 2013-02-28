require 'digest/md5'

class User < ActiveRecord::Base
  # attr_accessor :password

  EMAIL_REGEX = /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i

  has_many :posts
  has_many :comments
  has_many :commentvotes
  has_many :postvotes

  validates :first_name, :last_name, :presence => true
  validates :email, :presence => true,
                    :format => { :with => EMAIL_REGEX },
                    :uniqueness => { :case_sensitive => false }
  validates :hashed_password, :presence => true,
                              :length => { :minimum => 6 }

  before_create :encrypt_password

  def authenticate(password)
    self.hashed_password == Digest::MD5.hexdigest(password) 
  end

  private
  def encrypt_password
    self.hashed_password = Digest::MD5.hexdigest(self.hashed_password)
    # hashed password should be equal to regular password:
      # self.hashed_password = Digest::MD5.hexdigest(self.password)
  end
end

class Author < ActiveRecord::Base
  belongs_to :user
  attr_accessible :address, :birth, :ctype, :name, :photo
  has_and_belongs_to_many :books
end

class User < ActiveRecord::Base
  attr_accessible :dm, :email, :password, :roles, :username
  def self.authenticate(username,password)
  	where(:username => username, :password => Digest::SHA1.hexdigest(password)).first
  end
end

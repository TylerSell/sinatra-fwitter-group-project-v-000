class User < ActiveRecord::Base
  has_secure_password
  #validates_presence_of :username, :email, :password_digest
  has_many :tweets

  def slug
     self.username.gsub(/ /, '-').downcase
  end

  def self.find_by_slug(slug)
    user_name = slug.gsub(/-/, ' ')
    User.all.each do |user|
      if user.username.downcase == user_name
        @user = user
      end
    end
    @user
  end

end


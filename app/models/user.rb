class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :articles  
  def self.from_omniauth(auth)    
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|    	
      user.email = auth.info.email
      user.name  = auth.info.name
      user.password = Devise.friendly_token[0,20]
      user.picture 	 = auth.info.image      
    end
  end
  def fb_user?
    !self.uid.nil?
  end
    
  def owns_article?(article)
   true if self.articles.include?(article)
  end
end

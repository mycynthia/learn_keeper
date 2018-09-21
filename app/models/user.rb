class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook,:google_oauth2]
  # devise add name column must exist
  validates_presence_of :name
  
  def self.from_omniauth(auth, provider)
      puts "Facebook"
      puts provider == :facebook
      puts "google"
      puts provider == :google
      if provider == :facebook
        # Case 1: Find existing user by facebook uid
        user = User.find_by_fb_uid( auth.uid )
        if user
          user.fb_token = auth.credentials.token
          user.save!
          return user
        end

        # Case 2: Find existing user by email
        existing_user = User.find_by_email( auth.info.email )
        if existing_user
          existing_user.fb_uid = auth.uid
          existing_user.fb_token = auth.credentials.token
          existing_user.save!
          return existing_user
        end

        # Case 3: Create new password
        user = User.new
        user.fb_uid = auth.uid
        user.fb_token = auth.credentials.token
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name
        user.save!
        return user
      elsif provider == :google
        # Case 1: Find existing user by facebook uid
        user = User.find_by_google_uid( auth.uid )
        if user
          puts "user find by uid"
          user.google_token = auth.credentials.token
          user.save!
          return user
        end

        # Case 2: Find existing user by email
        existing_user = User.find_by_email( auth.info.email )
        if existing_user
          puts "user find by email"
          existing_user.google_uid = auth.uid
          existing_user.google_token = auth.credentials.token
          existing_user.save!
          return existing_user
        end

        # Case 3: Create new password
        user = User.new
        user.google_uid = auth.uid
        user.google_token = auth.credentials.token
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name
        user.save!
        puts "new user"
        return user
      end
  end
end
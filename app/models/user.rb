class User < ActiveRecord::Base

  has_many :habits
  has_many :sponsorships

  def self.find_or_create_by_uid(provider, uid, token)
    if user = User.find_by_uid(uid)
      return user
    else
      user = User.create(provider: provider, uid: uid, access_token: token)
      return user
    end
  end

end

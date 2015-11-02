require 'bcrypt'

class User < ActiveRecord::Base
  has_many :tweets
  has_many :active_relationships, class_name: "Relationship",
                                 foreign_key: "follower_id"
  has_many :passive_relationships, class_name: "Relationship",
                                 foreign_key: "followed_id"
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  validates :name, presence: true,
                    uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: 7}

  def feed
    following_ids = "SELECT followed_id FROM relationships
                      WHERE follower_id = :user_id"
    Tweet.where("user_id IN (#{following_ids}) OR user_id = :user_id", user_id: id)
  end

  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  def following?(other_user)
    following.include?(other_user)
  end

end

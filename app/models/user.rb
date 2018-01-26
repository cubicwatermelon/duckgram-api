class User < ApplicationRecord
  #Validations
  validates_presence_of :name, :email, :password_digest
  validates :email, uniqueness: true
 
  #encrypt password
  has_secure_password

  has_many :posts, dependent: :destroy
  has_many :active_relationships,  class_name:  "Relationship",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE  follower_id = :user_id"
    Post.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)
        .order("created_at DESC")
  end

  def recent_likes
    Like.where("post_id IN (:post_ids)", post_ids: posts.ids).last(12)
  end

  def like(post)
    liked_posts << post
  end

  def dislike(post)
    liked_posts.delete(post)
  end
end
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :image, styles: { medium: "300x300#", thumb: "100x100#", large:"900x900#", small:"200x200#", small_thumb: "30x30#"}
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  has_many :pictures

  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed


  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  #Followers A User
  def follow(other_user)
  	active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
  	active_relationships.find_by(followed_id: other_user.id).destroy
  end

  #Returns true if current user following the other user  
  def following?(other_user)
  	following.include?(other_user)
  end

end

class User < ApplicationRecord
  has_many :dvds
  has_many :upcs, through: :dvds

  validates_format_of :name, with: /\A[\w-]+\z/, message: "May only contain letters, numbers, dashes, and underscores."
  validates_presence_of :email, :name, :oauth_uid
  validates_uniqueness_of :oauth_uid, :name
end

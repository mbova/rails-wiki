class Article < ActiveRecord::Base
  has_one :author
  has_many :sharings
  has_many :users, through: :sharings

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  include Bootsy::Container

end
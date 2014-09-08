class Article < ActiveRecord::Base
  has_many :users, through: :sharings
  belongs_to :author

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  include Bootsy::Container

end
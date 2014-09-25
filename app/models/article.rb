class Article < ActiveRecord::Base
  has_one :author
  has_many :collaborations
  has_many :users, through: :collaborations

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  include Bootsy::Container

end
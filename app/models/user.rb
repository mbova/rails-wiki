class User < ActiveRecord::Base
  has_many :collaborations
  has_many :articles, through: :collaborations
  has_many :payments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         		
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  def role?(base_role)
    role == base_role.to_s
  end

end
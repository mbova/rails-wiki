class User < ActiveRecord::Base
  has_many :sharings
  has_many :articles, through: :sharings

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         		
  extend FriendlyId
  friendly_id :name, use: :slugged

  def role?(base_role)
    role == base_role.to_s
  end

end
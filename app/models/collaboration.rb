class Collaboration < ActiveRecord::Base
  belongs_to :user
  belongs_to :article

 # extend FriendlyId
 #  friendly_id :title, use: [:slugged, :history] 
  
end

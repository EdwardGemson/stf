class Business < ActiveRecord::Base
  has_many :artists
  has_many :recording_sessions
  has_many :consultations
end
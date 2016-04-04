class RecordingSession < ActiveRecord::Base
  belongs_to :business
  belongs_to :artist

  def create_meeting_time
  end
end
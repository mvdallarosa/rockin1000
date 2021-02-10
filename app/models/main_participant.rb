class MainParticipant < ApplicationRecord
  belongs_to :event
  belongs_to :media
end

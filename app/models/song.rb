class Song < ApplicationRecord
  belongs_to :media
  belongs_to :event
end

class MediaCollection < ApplicationRecord
  belongs_to :media
  belongs_to :gallery
end

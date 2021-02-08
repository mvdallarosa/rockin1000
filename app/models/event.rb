class Event < ApplicationRecord
  belongs_to :type
  belongs_to :media
  belongs_to :gallery
end

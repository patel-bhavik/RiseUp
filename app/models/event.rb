class Event < ApplicationRecord
  has_many :user_activity_histories
end

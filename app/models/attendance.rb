class Attendance < ApplicationRecord
  belongs_to :attendee, class_name: 'User', foreign_key: 'user_id'
  belongs_to :attended_meeting, class_name: 'Meeting', foreign_key: 'meeting_id'
end

# frozen_string_literal: true

class Meeting < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :invites, inverse_of: :invited_to_meeting
  has_many :invited_users, through: :invites, class_name: 'User'
  has_many :attendances, inverse_of: :attended_meeting
  has_many :attendees, through: :attendances, class_name: 'User'
  validates :content, presence: true
end

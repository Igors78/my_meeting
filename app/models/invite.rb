# frozen_string_literal: true

class Invite < ApplicationRecord
  belongs_to :invited_user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :invited_to_meeting, class_name: 'Meeting', foreign_key: 'meeting_id'
end

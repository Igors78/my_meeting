# frozen_string_literal: true

class Meeting < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'

  validates :content, presence: true
end

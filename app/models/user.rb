# frozen_string_literal: true

class User < ApplicationRecord
  has_many :meetings, inverse_of: :creator, dependent: :destroy
  has_many :invites, inverse_of: :invited_user
  has_many :invited_to_meetings, through: :invites, class_name: 'Meeting'
  validates :name, presence: true, uniqueness: true
end

# frozen_string_literal: true

class Meeting < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
end

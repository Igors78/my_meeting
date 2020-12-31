# frozen_string_literal: true

class User < ApplicationRecord
  has_many :meetings, inverse_of: :creator, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end

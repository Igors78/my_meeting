# frozen_string_literal: true

class User < ApplicationRecord
  has_many :meetings, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end

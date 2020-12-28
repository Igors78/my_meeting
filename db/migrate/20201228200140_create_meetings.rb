# frozen_string_literal: true

class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.text :content

      t.timestamps
    end
  end
end

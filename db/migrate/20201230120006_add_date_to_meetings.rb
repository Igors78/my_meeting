class AddDateToMeetings < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :date, :datetime
  end
end

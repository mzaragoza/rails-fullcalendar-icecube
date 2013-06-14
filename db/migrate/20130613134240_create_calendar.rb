class CreateCalendar < ActiveRecord::Migration
  def up
    create_table :calendars do |t|
      t.string :name
      t.text :description
      t.string :color

      t.timestamps
    end

    add_column :events, :calendar_id, :integer
  end

  def down
    drop_table :calendars
    remove_column :events, :calendar_id
  end
end

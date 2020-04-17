class CreateShows < ActiveRecord::Migration[5.1]
  def change
    create_table :shows do |t|
      t.integer :movie_id
      t.integer :venue_id
      t.boolean :status

      t.timestamps
    end
  end
end

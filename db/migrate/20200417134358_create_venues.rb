class CreateVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :venues do |t|
      t.string :name
      t.integer :cols
      t.integer :rows

      t.timestamps
    end
  end
end

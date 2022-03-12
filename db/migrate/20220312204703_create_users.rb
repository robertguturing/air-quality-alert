class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :air_quality_threshold, null: false, default: 101
      t.string :city, null: false
      t.timestamps
    end
  end
end

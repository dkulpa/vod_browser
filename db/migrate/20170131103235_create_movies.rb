class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.integer :time
      t.decimal :rating, precision: 2, scale: 1

      t.timestamps
    end
  end
end

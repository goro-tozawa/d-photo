class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.timestamps
      t.string :title,              null: false
      t.integer :area_id,              null: false
      t.references :user, null: false, foreign_key: true
    end
  end
end

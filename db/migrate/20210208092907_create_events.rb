class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.json :title
      t.json :description
      t.json :location
      t.json :city
      t.string :date
      t.string :status
      t.references :type, null: false, foreign_key: true
      t.references :media, null: false, foreign_key: true
      t.references :gallery, null: false, foreign_key: true

      t.timestamps
    end
  end
end

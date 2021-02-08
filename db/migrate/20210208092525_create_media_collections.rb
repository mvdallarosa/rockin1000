class CreateMediaCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :media_collections do |t|
      t.references :media, null: false, foreign_key: true
      t.references :gallery, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateMainParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :main_participants do |t|
      t.string :first_name
      t.string :last_name
      t.json :type
      t.references :event, null: false, foreign_key: true
      t.references :media, null: false, foreign_key: true

      t.timestamps
    end
  end
end

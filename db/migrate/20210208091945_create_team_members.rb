class CreateTeamMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :team_members do |t|
      t.string :first_name
      t.string :last_name
      t.json :role
      t.string :linkedin
      t.json :biography
      t.references :media, null: false, foreign_key: true

      t.timestamps
    end
  end
end

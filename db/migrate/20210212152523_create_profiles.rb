class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles, id: :uuid do |t|
      t.string :name, null: false
      t.belongs_to :account, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end

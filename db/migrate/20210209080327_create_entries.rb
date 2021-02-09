class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries, id: :uuid do |t|
      t.belongs_to :account, null: false, foreign_key: true, type: :uuid
      t.references :entryable, null: false, type: :uuid, polymorphic: true

      t.timestamps
    end
  end
end

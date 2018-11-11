class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.text :term, null: false

      t.timestamps
    end
  end
end

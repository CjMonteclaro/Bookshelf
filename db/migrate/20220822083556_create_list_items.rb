class CreateListItems < ActiveRecord::Migration[7.0]
  def change
    create_table :list_items do |t|
      t.references :book
      t.references :user
      t.integer :rating
      t.string :notes
      t.date :start_date
      t.date :finish_date

      t.timestamps
    end
  end
end

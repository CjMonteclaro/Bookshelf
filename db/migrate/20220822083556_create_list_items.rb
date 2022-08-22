class CreateListItems < ActiveRecord::Migration[7.0]
  def change
    create_table :list_items do |t|
      t.string :book_id
      t.string :owner_id
      t.integer :rating
      t.string :notes
      t.date :start_date
      t.date :finish_date

      t.timestamps
    end
  end
end

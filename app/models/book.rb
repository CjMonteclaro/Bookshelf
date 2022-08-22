class Book < ApplicationRecord
  has_many :list_items
  has_many :users, through: :list_items, foreign_key: "owner_id"

  def new_books
    currently_listed = ListItem.where(owner_id: current_user.id).collect(&:book_id)

    self.where.not(id: currently_listed)
  end
  
end
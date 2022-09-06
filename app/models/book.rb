# == Schema Information
#
# Table name: books
#
#  id              :bigint           not null, primary key
#  author          :string
#  cover_image_url :string
#  page_count      :integer
#  publisher       :string
#  synopsis        :text
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Book < ApplicationRecord
  has_many :list_items, dependent: :destroy
  has_many :users, through: :list_items, foreign_key: :owner_id

  validates :title, presence: true
  validates :author, presence: true
  validates :publisher, presence: true

  def self.new_books(current_api_user)
    currently_listed = ListItem.where(owner_id: current_api_user.id).collect(&:book_id)

    self.where.not(id: currently_listed)
  end
  
end

# == Schema Information
#
# Table name: list_items
#
#  id          :bigint           not null, primary key
#  finish_date :date
#  notes       :string
#  rating      :integer
#  start_date  :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  book_id     :string
#  user_id    :string
#
class ListItem < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :user_id, presence: true

  scope :reading_list, -> { where(finish_date: nil).where.not(start_date: nil) }
  scope :finished, -> { where.not(finish_date: nil) }
end

class ListItem < ApplicationRecord
  belongs_to :book
  belongs_to :user

  scope :reading_list, -> { where(finish_date: nil).where.not(start_date: nil)}
  scope :finished, -> { where.not(finish_date: nil)}
end

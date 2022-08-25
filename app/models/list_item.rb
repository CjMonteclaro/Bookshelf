class ListItem < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :owner_id, presence: true

  scope :reading_list, -> { where(finish_date: nil).where.not(start_date: nil)}
  scope :finished, -> { where.not(finish_date: nil)}
end

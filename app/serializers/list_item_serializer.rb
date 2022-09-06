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
#  owner_id    :string
#
class ListItemSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  belongs_to :book
  belongs_to :user
  attributes :rating, :notes, :start_date, :finish_date
end

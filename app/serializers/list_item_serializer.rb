class ListItemSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  belongs_to :book
  belongs_to :user
  attributes :rating, :notes, :start_date, :finish_date
end

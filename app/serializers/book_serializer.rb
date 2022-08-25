class BookSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :author, :publisher, :synopsis, :cover_image_url, :page_count
end

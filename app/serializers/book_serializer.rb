class BookSerializer < ActiveModel::Serializer
  attributes :title, :author, :publisher, :synopsis, :cover_image_url, :pageCount
end

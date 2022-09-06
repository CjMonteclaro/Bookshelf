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
class BookSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :author, :publisher, :synopsis, :cover_image_url, :page_count
end

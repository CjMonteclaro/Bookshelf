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
require "test_helper"

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

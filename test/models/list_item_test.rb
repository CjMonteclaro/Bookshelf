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
require "test_helper"

class ListItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

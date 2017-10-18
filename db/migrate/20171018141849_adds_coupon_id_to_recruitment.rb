class AddsCouponIdToRecruitment < ActiveRecord::Migration[5.1]
  def change
    add_reference :recruitments, :coupon, foreign_key: true
  end
end

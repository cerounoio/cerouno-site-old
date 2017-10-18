class RemovesRecruitmentIdFromCoupon < ActiveRecord::Migration[5.1]
  def change
    remove_reference :coupons, :recruitment
  end
end

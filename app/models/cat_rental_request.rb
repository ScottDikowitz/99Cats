class CatRentalRequest < ActiveRecord::Base
  validates :cat_id,:start_date, :end_date, presence: true
  validates :status, inclusion:  { :in => ["DENIED","APPROVED","DENIED"] }

  belongs_to(
    :cat,
    class_name: "Cat",
    foreign_key: :cat_id,
    primary_key: :id
  )

  def overlapping_requests
    CatRentalRequest
      .where("id IS NULL OR id != ?", id)
      .where("id = ?", cat_id)
      .where("NOT (? < cat.start_date OR cat.end_date < ?)", end_date, start_date)
  end

  def overlapping_approved_requests
    over_lapped_requests = overlapping_requests
    over_lapped_requests.where("status = ?", "APPROVED")
  end

end

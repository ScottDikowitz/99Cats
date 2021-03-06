require 'date'

class Cat < ActiveRecord::Base
  validates :birth_date, :color, :name, :sex, presence: true
  validates :sex, inclusion: { :in => ['M', 'F'] }
  validates :color, inclusion:  { :in => ["brown","orange","black","white","grey"] }

  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )
  has_many(
    :rental_requests,
    class_name: "CatRentalRequest",
    foreign_key: :cat_id,
    primary_key: :id,
    :dependent => :destroy
  )

  def age
    Date.current - birth_date
  end

end

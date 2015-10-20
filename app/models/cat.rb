require 'date'

class Cat < ActiveRecord::Base
  validates :birth_date, :color, :name, :sex, presence: true
  validates :sex, inclusion: { :in => ['M', 'F'] }
  validates :color, inclusion:  { :in => ["brown","orange","black","white","grey"] }

  def age
    Date.current - birth_date
  end

end

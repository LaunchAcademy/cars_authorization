class Car < ActiveRecord::Base
  validates :make,
    presence: true

  validates :model,
    presence: true

  validates :year,
    presence: true,
    numericality: true

  validates :color,
    presence: true

  validates :price,
    presence: true,
    numericality: true

  def friendly_title
    "#{year} #{color} #{make} #{model} (#{price})"
  end
end

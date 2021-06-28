class Product < ApplicationRecord
  validates :name, length: { minimum: 2}
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { in: 10..50}
  validates :amount_in_inventory, numericality: {only_integer: true}
  belongs_to :supplier
  has_many :images
  has_many :orders

  def is_discounted?
    if price < 10
      true
    else
      false
    end
  end
  
  def tax
    price * 0.09
  end 

  def total
    price + tax
  end

end

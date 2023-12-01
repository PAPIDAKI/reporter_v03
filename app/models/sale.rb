class Sale < ApplicationRecord
  self.table_name = "sales"
  
  def self.search(search)
    if search
      where(["name LIKE ?", "%#{search}%"])
    else
      all
    end
  end
end

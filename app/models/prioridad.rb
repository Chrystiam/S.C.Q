class Prioridad < ActiveRecord::Base

  has_many :comites 

  attr_accessible :nombre
  
  #buscador
  def self.search(search)
		where('nombre like ?', "%#{search}%",)
	end
end

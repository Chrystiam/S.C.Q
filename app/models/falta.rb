class Falta < ActiveRecord::Base
  
  has_many :quejas 

  attr_accessible :descripcion, :falta

  validates_presence_of :descripcion

  validates_presence_of :falta

  #buscador
    def self.search(search)
		where('falta like ?', "%#{search}%",)
	end

end

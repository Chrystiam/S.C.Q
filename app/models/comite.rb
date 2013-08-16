class Comite < ActiveRecord::Base
  belongs_to :queja
  belongs_to :falta
  belongs_to :prioridad


  attr_accessible :fecha, :hora, :lugar, :falta_id, :queja_id, :queja_nombres, :prioridad_id

    def self.search(search)
		where('lugar like ?', "%#{search}%",)
	end
end

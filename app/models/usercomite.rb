class Usercomite < ActiveRecord::Base
    belongs_to :cargo
    attr_accessible :cedula, :email, :fch_ncto, :nc, :cargo_id
  
    def self.search(search)
		where('nc like ?', "%#{search}%",)
	end

end

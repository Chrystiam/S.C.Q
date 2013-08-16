class QuejaMailer < ActionMailer::Base
    
	def registration_confirmation(queja)

		@queja = queja
		attachments["logosena.jpg"] = File.read("#{Rails.root}/app/assets/images/logosena.jpg")
 		mail(:to => queja.email, :subject => "Registro de Queja exitoso", :from => "geraldinearenass@gmail.com")
    end

end
class QuejasController < ApplicationController
  
  helper_method :sort_column, :sort_direction

  def index
    @rxp = (params[:registro])? params[:registro].to_i : 2
    if ((@rxp) == 0) or ((@rxp) < 0) then
      @rxp = 1
    end

    @quejas  = Queja.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(@rxp)
    
    #esta variable trae todos los registros para el pdf
    @a= Queja.all 
    output = QuejaList.new(@a,view_context) # Aquí instancio el documento pdf
    respond_to do |format|
      format.pdf{
        send_data output.render, :filename => "quejaList.pdf", :type => "application/pdf", 
        :disposition => "inline" # este parámetro permite ver el documento pdf en linea.
      }
      format.html #{ render :text => "<h1>Use .pdf</h1>".html_safe }
      format.json { render json: @quejas  }
    end
  end

  #metodo para descargar evidencia
  def download
    @queja = Queja.find(params[:id])
    send_file(@queja.evidencia.path)
  end 


  def show
    @queja = Queja.find(params[:id])
  end

  
  def new
    @programas = Programa.all
    @fichas = Ficha.all
    @queja = Queja.new
  end

 
  def edit
    @programas = Programa.all
    @fichas = Ficha.all
    @queja = Queja.find(params[:id])
  end

  
  def update_fichas
    @fichas = Ficha.where('programa_id = ?', params[:programa_id])
    render :partial => "fichas", :object => @fichas
  end


  def create
    @queja = Queja.new(params[:queja])
    render :action => :new unless @queja.save
    QuejaMailer.registration_confirmation(@queja).deliver

    @quejas = Queja.all
  end
    
  
  def update
    @queja = Queja.find(params[:id])
    if @queja.update_attributes(params[:queja])
      QuejaMailer.registration_confirmation(@queja).deliver
    else
      render :action => :edit
    end  
  end
   
  
  def destroy
    @queja = Queja.find(params[:id])
    @queja.destroy
    @quejas = Queja.all
  end
  
 
  private
  def sort_column
    Queja.column_names.include?(params[:sort]) ? params[:sort] : "nombres"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
    

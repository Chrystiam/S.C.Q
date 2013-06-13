class CentrosController < ApplicationController
  # GET /centros
  # GET /centros.json
  def index
    @centros = Centro.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @centros }
    end
  end

  # GET /centros/1
  # GET /centros/1.json
  def show
    @centro = Centro.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @centro }
    end
  end

  # GET /centros/new
  # GET /centros/new.json
  def new
    @centro = Centro.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @centro }
    end
  end

  # GET /centros/1/edit
  def edit
    @centro = Centro.find(params[:id])
  end

  # POST /centros
  # POST /centros.json
  def create
    @centro = Centro.new(params[:centro])

    respond_to do |format|
      if @centro.save
        format.html { redirect_to @centro, notice: 'Centro was successfully created.' }
        format.json { render json: @centro, status: :created, location: @centro }
      else
        format.html { render action: "new" }
        format.json { render json: @centro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /centros/1
  # PUT /centros/1.json
  def update
    @centro = Centro.find(params[:id])

    respond_to do |format|
      if @centro.update_attributes(params[:centro])
        format.html { redirect_to @centro, notice: 'Centro was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @centro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /centros/1
  # DELETE /centros/1.json
  def destroy
    @centro = Centro.find(params[:id])
    @centro.destroy

    respond_to do |format|
      format.html { redirect_to centros_url }
      format.json { head :no_content }
    end
  end
end

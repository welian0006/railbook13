class ClonetsController < ApplicationController
  # GET /clonets
  # GET /clonets.json
  def index
    @clonets = Clonet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clonets }
    end
  end

  # GET /clonets/1
  # GET /clonets/1.json
  def show
    @clonet = Clonet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @clonet }
    end
  end

  # GET /clonets/new
  # GET /clonets/new.json
  def new
    @clonet = Clonet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @clonet }
    end
  end

  # GET /clonets/1/edit
  def edit
    @clonet = Clonet.find(params[:id])
  end

  # POST /clonets
  # POST /clonets.json
  def create
    @clonet = Clonet.new(params[:clonet])

    respond_to do |format|
      if @clonet.save
        format.html { redirect_to @clonet, notice: 'Clonet was successfully created.' }
        format.json { render json: @clonet, status: :created, location: @clonet }
      else
        format.html { render action: "new" }
        format.json { render json: @clonet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clonets/1
  # PUT /clonets/1.json
  def update
    @clonet = Clonet.find(params[:id])

    respond_to do |format|
      if @clonet.update_attributes(params[:clonet])
        format.html { redirect_to @clonet, notice: 'Clonet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @clonet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clonets/1
  # DELETE /clonets/1.json
  def destroy
    @clonet = Clonet.find(params[:id])
    @clonet.destroy

    respond_to do |format|
      format.html { redirect_to clonets_url }
      format.json { head :no_content }
    end
  end
end

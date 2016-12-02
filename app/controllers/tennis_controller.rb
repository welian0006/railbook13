class TennisController < ApplicationController
  # GET /tennis
  # GET /tennis.json
  def index
    @tennis = Tenni.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tennis }
    end
  end

  # GET /tennis/1
  # GET /tennis/1.json
  def show
    @tenni = Tenni.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tenni }
    end
  end

  # GET /tennis/new
  # GET /tennis/new.json
  def new
    @tenni = Tenni.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tenni }
    end
  end

  # GET /tennis/1/edit
  def edit
    @tenni = Tenni.find(params[:id])
  end

  # POST /tennis
  # POST /tennis.json
  def create
    @tenni = Tenni.new(params[:tenni])

    respond_to do |format|
      if @tenni.save
        format.html { redirect_to @tenni, notice: 'Tenni was successfully created.' }
        format.json { render json: @tenni, status: :created, location: @tenni }
      else
        format.html { render action: "new" }
        format.json { render json: @tenni.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tennis/1
  # PUT /tennis/1.json
  def update
    @tenni = Tenni.find(params[:id])

    respond_to do |format|
      if @tenni.update_attributes(params[:tenni])
        format.html { redirect_to @tenni, notice: 'Tenni was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tenni.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tennis/1
  # DELETE /tennis/1.json
  def destroy
    @tenni = Tenni.find(params[:id])
    @tenni.destroy

    respond_to do |format|
      format.html { redirect_to tennis_url }
      format.json { head :no_content }
    end
  end
end

class MouseRacksController < ApplicationController
  before_action :set_mouse_rack, only: [:show, :edit, :update, :destroy]

  # GET /mouse_racks
  # GET /mouse_racks.json
  def index
    @mouse_racks = MouseRack.all
  end

  # GET /mouse_racks/1
  # GET /mouse_racks/1.json
  def show
    @slots = Slot.where(:mouse_rack_id => params[:id])
  end

  # GET /mouse_racks/new
  def new
    @mouse_rack = MouseRack.new
  end

  # GET /mouse_racks/1/edit
  def edit
  end

  # POST /mouse_racks
  # POST /mouse_racks.json
  def create
    @mouse_rack = MouseRack.new(mouse_rack_params)

    respond_to do |format|
      if @mouse_rack.save
        format.html { redirect_to @mouse_rack, notice: 'Mouse rack was successfully created.' }
        format.json { render :show, status: :created, location: @mouse_rack }
      else
        format.html { render :new }
        format.json { render json: @mouse_rack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mouse_racks/1
  # PATCH/PUT /mouse_racks/1.json
  def update
    respond_to do |format|
      if @mouse_rack.update(mouse_rack_params)
        format.html { redirect_to @mouse_rack, notice: 'Mouse rack was successfully updated.' }
        format.json { render :show, status: :ok, location: @mouse_rack }
      else
        format.html { render :edit }
        format.json { render json: @mouse_rack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mouse_racks/1
  # DELETE /mouse_racks/1.json
  def destroy
    @mouse_rack.destroy
    respond_to do |format|
      format.html { redirect_to mouse_racks_url, notice: 'Mouse rack was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mouse_rack
      @mouse_rack = MouseRack.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mouse_rack_params
      params.require(:mouse_rack).permit(:number, :type, :side)
    end
end

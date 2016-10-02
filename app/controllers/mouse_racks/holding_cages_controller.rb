class MouseRacks::HoldingCagesController < ApplicationController
  before_action :set_holding_cage, only: [:show, :edit, :update, :destroy]

  def index
    @holding_cages = HoldingCage.all
  end

  def show
    @mouse_rack = @holding_cage.mouse_rack
    @mice = Mouse.where(holding_cage_id: @holding_cage.id)
  end

  def new
    @holding_cage = HoldingCage.new
    @mouse_rack = MouseRack.find(params[:mouse_rack_id])
  end

  def edit
    @mouse_rack = @holding_cage.mouse_rack
  end

  def create
    @mouse_rack = MouseRack.find(params[:mouse_rack_id])
    @holding_cage = HoldingCage.new(holding_cage_params)
    @holding_cage.mouse_rack_id = @mouse_rack.id
    @holding_cage.slotable_type = "Slot"

    respond_to do |format|
      if @holding_cage.save
        format.html { redirect_to @mouse_rack, notice: 'Holding cage was successfully created.' }
        format.json { render :show, status: :created, location: @mouse_rack }
      else
        format.html { render :new }
        format.json { render json: @holding_cage.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @holding_cage.update(holding_cage_params)
        format.html { redirect_to @holding_cage, notice: 'Holding cage was successfully updated.' }
        format.json { render :show, status: :ok, location: @holding_cage }
      else
        format.html { render :edit }
        format.json { render json: @holding_cage.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @holding_cage.destroy
    respond_to do |format|
      format.html { redirect_to holding_cages_url, notice: 'Holding cage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_holding_cage
      @holding_cage = HoldingCage.find(params[:id])
    end

    def holding_cage_params
      params.require(:holding_cage).permit(:cage_id, :occupancy, :sex, :dob, :mouse_rack_id, :slotable_id)
    end
end

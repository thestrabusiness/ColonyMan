class MouseRack::CageController < ApplicationController
  before_action :set_cage, only: [:show, :edit, :update, :destroy]

  def index
    @cages = HoldingCage.all
  end

  def show
    @mouse_rack = @cage.mouse_rack
    @mice = Mouse.where(cage_id: @cage.id)
  end

  def new
    @cage = HoldingCage.new
    @mouse_rack = MouseRack.find(params[:mouse_rack_id])
  end

  def edit
    @mouse_rack = @cage.mouse_rack
  end

  def create
    @mouse_rack = MouseRack.find(params[:mouse_rack_id])
    @cage = HoldingCage.new(cage_params)
    @cage.mouse_rack_id = @mouse_rack.id

    respond_to do |format|
      if @cage.save
        format.html { redirect_to @mouse_rack, notice: 'Holding cage was successfully created.' }
        format.json { render :show, status: :created, location: @mouse_rack }
      else
        format.html { render :new }
        format.json { render json: @cage.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @cage.update(cage_params)
        format.html { redirect_to @cage, notice: 'Holding cage was successfully updated.' }
        format.json { render :show, status: :ok, location: @cage }
      else
        format.html { render :edit }
        format.json { render json: @cage.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cage.destroy
    respond_to do |format|
      format.html { redirect_to cages_url, notice: 'Holding cage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_cage
      @cage = HoldingCage.find(params[:id])
    end

    def cage_params
      params.require(:cage).permit(:cage_id, :occupancy, :sex, :dob, :mouse_rack_id, :slot_id)
    end
end

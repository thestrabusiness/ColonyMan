class MouseRacks::SlotsController < ApplicationController

  def index
    @slots = Slot.all
  end

  def show
  end

  def new
    @slot = Slot.new
  end

  def edit
  end

  def create
    @slot = Slot.new(slot_params)
    @slot.save
  end

  def update
    
  end

  def destroy
  end

  private

    def set_slot
      @slot = Slot.find(params[:id])
    end

    def slot_params
      params.require(:slot).permit(:position, :occupied, :side,:mouse_rack_id)
    end

  end

end

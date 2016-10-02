class MiceController < ApplicationController
  before_action :set_mouse, only: [:show, :edit, :update, :destroy]

  def index
    @mice = Mouse.all
  end

  def show
  end
  
  def new
    @mouse = Mouse.new
    @holding_cage = HoldingCage.find(params[:holding_cage_id])
  end

  def edit
  end

  def create
    @mouse = Mouse.new(mouse_params)
    @holding_cage = HoldingCage.find(params[:holding_cage_id])
    @mouse.holding_cage_id = @holding_cage.id
    @mouse.sex = @holding_cage.sex
    @holding_cage.update_pop("create")

    respond_to do |format|
      if @mouse.save
        format.html { redirect_to @holding_cage, notice: 'Mouse was successfully created.' }
        format.json { render :show, status: :created, location: @mouse }
      else
        format.html { render :new }
        format.json { render json: @mouse.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @mouse.update(mouse_params)
        format.html { redirect_to @mouse, notice: 'Mouse was successfully updated.' }
        format.json { render :show, status: :ok, location: @mouse }
      else
        format.html { render :edit }
        format.json { render json: @mouse.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @holding_cage = @mouse.holding_cage
    if @mouse.destroy
      @mouse.holding_cage.update_pop("destroy")
      respond_to do |format|
        format.html { redirect_to @holding_cage, notice: 'Mouse was successfully removed.' }
        format.json { head :no_content }
      end
    else
        format.html { redirect_to @holding_cage, notice: 'There was an error removing the mouse.'}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mouse
      @mouse = Mouse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mouse_params
      params.require(:mouse).permit(:dob, :sex, :number, :genotype)
    end
end

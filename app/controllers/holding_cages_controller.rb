class HoldingCagesController < ApplicationController
  before_action :set_holding_cage, only: [:show, :edit, :update, :destroy]

  # GET /holding_cages
  # GET /holding_cages.json
  def index
    @holding_cages = HoldingCage.all
  end

  # GET /holding_cages/1
  # GET /holding_cages/1.json
  def show
  end

  # GET /holding_cages/new
  def new
    @holding_cage = HoldingCage.new
  end

  # GET /holding_cages/1/edit
  def edit
  end

  # POST /holding_cages
  # POST /holding_cages.json
  def create
    @holding_cage = HoldingCage.new(holding_cage_params)

    respond_to do |format|
      if @holding_cage.save
        format.html { redirect_to @holding_cage, notice: 'Holding cage was successfully created.' }
        format.json { render :show, status: :created, location: @holding_cage }
      else
        format.html { render :new }
        format.json { render json: @holding_cage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /holding_cages/1
  # PATCH/PUT /holding_cages/1.json
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

  # DELETE /holding_cages/1
  # DELETE /holding_cages/1.json
  def destroy
    @holding_cage.destroy
    respond_to do |format|
      format.html { redirect_to holding_cages_url, notice: 'Holding cage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_holding_cage
      @holding_cage = HoldingCage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def holding_cage_params
      params.require(:holding_cage).permit(:cage_id, :occupancy, :sex, :dob)
    end
end

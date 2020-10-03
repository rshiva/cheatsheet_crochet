class MasterStitchesController < ApplicationController
  before_action :set_master_stitch, only: [:show, :edit, :update, :destroy]

  # GET /master_stitches
  # GET /master_stitches.json
  def index
    @master_stitches = MasterStitch.all
  end

  # GET /master_stitches/1
  # GET /master_stitches/1.json
  def show
  end

  # GET /master_stitches/new
  def new
    @master_stitch = MasterStitch.new
  end

  # GET /master_stitches/1/edit
  def edit
  end

  # POST /master_stitches
  # POST /master_stitches.json
  def create
    @master_stitch = MasterStitch.new(master_stitch_params)

    respond_to do |format|
      if @master_stitch.save
        format.html { redirect_to @master_stitch, notice: 'Master stitch was successfully created.' }
        format.json { render :show, status: :created, location: @master_stitch }
      else
        format.html { render :new }
        format.json { render json: @master_stitch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /master_stitches/1
  # PATCH/PUT /master_stitches/1.json
  def update
    respond_to do |format|
      if @master_stitch.update(master_stitch_params)
        format.html { redirect_to @master_stitch, notice: 'Master stitch was successfully updated.' }
        format.json { render :show, status: :ok, location: @master_stitch }
      else
        format.html { render :edit }
        format.json { render json: @master_stitch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /master_stitches/1
  # DELETE /master_stitches/1.json
  def destroy
    @master_stitch.destroy
    respond_to do |format|
      format.html { redirect_to master_stitches_url, notice: 'Master stitch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_master_stitch
      @master_stitch = MasterStitch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def master_stitch_params
      params.require(:master_stitch).permit(:name)
    end
end

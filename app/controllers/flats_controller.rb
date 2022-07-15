class FlatsController < ApplicationController
  before_action :set_flat, only: %i[ show edit update destroy ]

  # GET /flats
  def index
    @flats = Flat.includes(:user).all
  end

  # GET /flats/1
  def show; end

  # GET /flats/new
  def new
    @flat = Flat.new
  end

  # GET /flats/1/edit
  def edit; end

  # POST /flats
  def create
    @flat = Flat.new(flat_params)

    respond_to do |format|
      if @flat.save
        format.html { redirect_to flats_path, notice: "Flat was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flats/1
  def update
    if @flat.update(flat_params)
      format.html { redirect_to flats_path, notice: "Flat was successfully updated." }
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.turbo_stream { render :form_update, status: :unprocessable_entity }
    end
  end

  # DELETE /flats/1
  def destroy
    @flat.destroy

    respond_to do |format|
      format.html { redirect_to flats_path, notice: "Flat was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_flat
      @flat = Flat.find(params[:id])
    end

    def flat_params
      params.require(:flat).permit(:user_id, :name, :latitude, :longitude)
    end
    
end

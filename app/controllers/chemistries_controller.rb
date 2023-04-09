class ChemistriesController < ApplicationController
  before_action :set_chemistry, only: %i[ show edit update destroy ]

  # GET /chemistries or /chemistries.json
  def index
    @chemistries = Chemistry.all
  end

  # GET /chemistries/1 or /chemistries/1.json
  def show
  end

  # GET /chemistries/new
  def new
    @chemistry = Chemistry.new
  end

  # GET /chemistries/1/edit
  def edit
  end

  # POST /chemistries or /chemistries.json
  def create
    @chemistry = Chemistry.new(chemistry_params)

    respond_to do |format|
      if @chemistry.save
        format.html { redirect_to chemistry_url(@chemistry), notice: "Chemistry was successfully created." }
        format.json { render :show, status: :created, location: @chemistry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chemistry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chemistries/1 or /chemistries/1.json
  def update
    respond_to do |format|
      if @chemistry.update(chemistry_params)
        format.html { redirect_to chemistry_url(@chemistry), notice: "Chemistry was successfully updated." }
        format.json { render :show, status: :ok, location: @chemistry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chemistry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chemistries/1 or /chemistries/1.json
  def destroy
    @chemistry.destroy

    respond_to do |format|
      format.html { redirect_to chemistries_url, notice: "Chemistry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chemistry
      @chemistry = Chemistry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chemistry_params
      params.require(:chemistry).permit(:title, :description, :clip, :thumbnail)
    end
end

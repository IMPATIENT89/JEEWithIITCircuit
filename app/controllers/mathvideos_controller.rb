class MathvideosController < ApplicationController
  before_action :set_mathvideo, only: %i[ show edit update destroy ]

  # GET /mathvideos or /mathvideos.json
  def index
    @mathvideos = Mathvideo.all
  end

  # GET /mathvideos/1 or /mathvideos/1.json
  def show
  end

  # GET /mathvideos/new
  def new
    @mathvideo = Mathvideo.new
  end

  # GET /mathvideos/1/edit
  def edit
  end

  # POST /mathvideos or /mathvideos.json
  def create
    @mathvideo = Mathvideo.new(mathvideo_params)

    respond_to do |format|
      if @mathvideo.save
        format.html { redirect_to mathvideo_url(@mathvideo), notice: "Mathvideo was successfully created." }
        format.json { render :show, status: :created, location: @mathvideo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mathvideo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mathvideos/1 or /mathvideos/1.json
  def update
    respond_to do |format|
      if @mathvideo.update(mathvideo_params)
        format.html { redirect_to mathvideo_url(@mathvideo), notice: "Mathvideo was successfully updated." }
        format.json { render :show, status: :ok, location: @mathvideo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mathvideo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mathvideos/1 or /mathvideos/1.json
  def destroy
    @mathvideo.destroy

    respond_to do |format|
      format.html { redirect_to mathvideos_url, notice: "Mathvideo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mathvideo
      @mathvideo = Mathvideo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mathvideo_params
      params.require(:mathvideo).permit(:title, :description, :clip, :thumbnail)
    end
end

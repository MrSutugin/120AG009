class SntsController < ApplicationController
  before_action :set_snt, only: %i[ show edit update destroy ]

  # GET /snts or /snts.json
  def index
    @snts = Snt.all
  end

  # GET /snts/1 or /snts/1.json
  def show
    @news = SntNews.where(snt_id: params[:id])
  end

  # GET /snts/new
  def new
    @snt = current_user.snts.new
  end

  # GET /snts/1/edit
  def edit
  end

  # POST /snts or /snts.json
  def create
    @snt = current_user.snts.new(snt_params)
    respond_to do |format|
      if @snt.save
        format.html { redirect_to account_company_path, notice: "Snt was successfully created." }
        format.json { render :show, status: :created, location: @snt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @snt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /snts/1 or /snts/1.json
  def update
    respond_to do |format|
      if @snt.update(snt_params)
        format.html { redirect_to snt_url(@snt), notice: "Snt was successfully updated." }
        format.json { render :show, status: :ok, location: @snt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @snt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /snts/1 or /snts/1.json
  def destroy
    @snt.destroy

    respond_to do |format|
      format.html { redirect_to snts_url, notice: "Snt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_snt
      @snt = Snt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def snt_params
      params.require(:snt).permit(:name, :address, :description, :user_id)
    end
end

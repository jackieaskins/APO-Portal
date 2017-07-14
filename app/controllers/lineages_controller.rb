class LineagesController < ApplicationController
  before_action :set_lineage, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /lineages
  # GET /lineages.json
  def index
    @lineages = Lineage.all
  end

  # GET /lineages/1
  # GET /lineages/1.json
  def show
  end

  # GET /lineages/new
  def new
    @lineage = Lineage.new
  end

  # GET /lineages/1/edit
  def edit
  end

  # POST /lineages
  # POST /lineages.json
  def create
    @lineage = Lineage.new(lineage_params)

    respond_to do |format|
      if @lineage.save
        format.html { redirect_to @lineage, notice: 'Lineage was successfully created.' }
        format.json { render :show, status: :created, location: @lineage }
      else
        format.html { render :new }
        format.json { render json: @lineage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lineages/1
  # PATCH/PUT /lineages/1.json
  def update
    respond_to do |format|
      if @lineage.update(lineage_params)
        format.html { redirect_to @lineage, notice: 'Lineage was successfully updated.' }
        format.json { render :show, status: :ok, location: @lineage }
      else
        format.html { render :edit }
        format.json { render json: @lineage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lineages/1
  # DELETE /lineages/1.json
  def destroy
    @lineage.destroy
    respond_to do |format|
      format.html { redirect_to lineages_url, notice: 'Lineage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lineage
      @lineage = Lineage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lineage_params
      params.require(:lineage).permit(:name, :head_id)
    end
end

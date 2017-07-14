class PledgeClassesController < ApplicationController
  before_action :set_pledge_class, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /pledge_classes
  # GET /pledge_classes.json
  def index
    @pledge_classes = PledgeClass.all
  end

  # GET /pledge_classes/1
  # GET /pledge_classes/1.json
  def show
  end

  # GET /pledge_classes/new
  def new
    @pledge_class = PledgeClass.new
  end

  # GET /pledge_classes/1/edit
  def edit
  end

  # POST /pledge_classes
  # POST /pledge_classes.json
  def create
    @pledge_class = PledgeClass.new(pledge_class_params)

    respond_to do |format|
      if @pledge_class.save
        format.html { redirect_to @pledge_class, notice: 'Pledge class was successfully created.' }
        format.json { render :show, status: :created, location: @pledge_class }
      else
        format.html { render :new }
        format.json { render json: @pledge_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pledge_classes/1
  # PATCH/PUT /pledge_classes/1.json
  def update
    respond_to do |format|
      if @pledge_class.update(pledge_class_params)
        format.html { redirect_to @pledge_class, notice: 'Pledge class was successfully updated.' }
        format.json { render :show, status: :ok, location: @pledge_class }
      else
        format.html { render :edit }
        format.json { render json: @pledge_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pledge_classes/1
  # DELETE /pledge_classes/1.json
  def destroy
    @pledge_class.destroy
    respond_to do |format|
      format.html { redirect_to pledge_classes_url, notice: 'Pledge class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pledge_class
      @pledge_class = PledgeClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pledge_class_params
      params.require(:pledge_class).permit(:name, :semester)
    end
end

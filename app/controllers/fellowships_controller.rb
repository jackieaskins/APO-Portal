class FellowshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_fellowship, except: [:index, :new, :create]
  before_action :authenticate_host, only: [:edit, :update, :destroy]

  # GET /fellowships
  # GET /fellowships.json
  def index
    @fellowships = Fellowship.all
  end

  # GET /fellowships/1
  # GET /fellowships/1.json
  def show
  end

  # GET /fellowships/new
  def new
    @fellowship = Fellowship.new
    @fellowship.fellowship_hosts.build
  end

  # GET /fellowships/1/edit
  def edit
    @fellowship.fellowship_hosts.build if @fellowship.fellowship_hosts.size < 2
  end

  # POST /fellowships
  # POST /fellowships.json
  def create
    @fellowship = Fellowship.new(fellowship_params)

    respond_to do |format|
      if @fellowship.save
        format.html { redirect_to @fellowship, notice: 'Fellowship was successfully created.' }
        format.json { render :show, status: :created, location: @fellowship }
      else
        format.html { render :new }
        format.json { render json: @fellowship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fellowships/1
  # PATCH/PUT /fellowships/1.json
  def update
    respond_to do |format|
      if @fellowship.update(fellowship_params)
        format.html { redirect_to @fellowship, notice: 'Fellowship was successfully updated.' }
        format.json { render :show, status: :ok, location: @fellowship }
      else
        format.html { render :edit }
        format.json { render json: @fellowship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fellowships/1
  # DELETE /fellowships/1.json
  def destroy
    @fellowship.destroy
    respond_to do |format|
      format.html { redirect_to fellowships_url, notice: 'Fellowship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def sign_up
    @fellowship.pending_fellowship_signups.create(user: current_user)
    redirect_to @fellowship
  end

  def drop
    @fellowship.pending_fellowship_signups.find_by(user: current_user).destroy
    redirect_to @fellowship
  end

  def reporting_form
    @users = User.where.not(id: @fellowship.pending_attendees).order(:last_name)
  end

  def report
    params[:attendees].each do |attendee_id|
      # TODO: Update number of points assigned based on fellowship type
      User.find(attendee_id).reported_fellowship_signups.create(fellowship: @fellowship, points: 1, is_host: params[:hosts].include?(attendee_id))
    end
    redirect_to @fellowship
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fellowship
      @fellowship = Fellowship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fellowship_params
      params.require(:fellowship).permit(:semester, :name, :fellowship_type, :location, :description, :start_time, :end_time, :has_signup_form, fellowship_hosts_attributes: [:id, :host_id])
    end

    def authenticate_host
      unless @fellowship.hosts.include? current_user
        respond_to do |format|
          format.html { redirect_to @fellowship, notice: "You must be the host to #{params[:action]} this fellowship." }
        end
      end
    end
end

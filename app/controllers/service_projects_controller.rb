class ServiceProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_service_project, except: [:index, :new, :create]

  # GET /service_projects
  # GET /service_projects.json
  def index
    @service_projects = ServiceProject.all
  end

  # GET /service_projects/1
  # GET /service_projects/1.json
  def show
  end

  # GET /service_projects/new
  def new
    @service_project = ServiceProject.new
  end

  # GET /service_projects/1/edit
  def edit
  end

  # POST /service_projects
  # POST /service_projects.json
  def create
    @service_project = ServiceProject.new(service_project_params)

    respond_to do |format|
      if @service_project.save
        format.html { redirect_to @service_project, notice: 'Service project was successfully created.' }
        format.json { render :show, status: :created, location: @service_project }
      else
        format.html { render :new }
        format.json { render json: @service_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_projects/1
  # PATCH/PUT /service_projects/1.json
  def update
    respond_to do |format|
      if @service_project.update(service_project_params)
        format.html { redirect_to @service_project, notice: 'Service project was successfully updated.' }
        format.json { render :show, status: :ok, location: @service_project }
      else
        format.html { render :edit }
        format.json { render json: @service_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_projects/1
  # DELETE /service_projects/1.json
  def destroy
    @service_project.destroy
    respond_to do |format|
      format.html { redirect_to service_projects_url, notice: 'Service project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def sign_up
    @service_project.add_attendee(current_user, params[:host_filter]) if user_signed_in?
    redirect_to @service_project
  end

  def drop
    @service_project.pending_service_project_signups.find_by(user: current_user).destroy
    redirect_to @service_project
  end

  def reporting_form
    @users = User.where.not(id: @service_project.pending_nonwaitlist_attendees).order(:last_name)
  end

  def report
    all_attendees = params[:additional_attendees] ? params[:attendees] + params[:additional_attendees] : params[:attendees]
    params[:attendees_points].each do |attendee_id, points|
      attendee = User.find(attendee_id)
      project_points = all_attendees.include?(attendee_id) ? points : -1
      attendee.reported_service_project_signups.create(service_project: @service_project, points: project_points, is_host: current_user == attendee)
    end

    redirect_to @service_project
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_service_project
    @service_project = ServiceProject.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def service_project_params
    params.require(:service_project).permit(:name, :start_time, :end_time, :location, :host_id, :project_type, :max_volunteers)
  end
end

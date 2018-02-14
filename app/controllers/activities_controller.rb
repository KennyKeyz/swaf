class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy, :toggle_status]

  layout "main_template"

  # GET /activities
  # GET /activities.json
  def index
    @activities = Activity.all
    #@activities = Activity.where(user_id: User.where(id: '8'))
  end

  def approvals
    @approvals = Activity.where(user_id: User.where(department_id: current_user.department_id))

  end  


  def sectorapprovals
    @sectapprovals = Activity.where(user_id: User.where(sector_id: current_user.sector_id))

  end  


  def staffapproved
    @staffapproved = Activity.where(user_id: current_user.id , status:"approved")

  end  

  # GET /activities/1
  # GET /activities/1.json
  def show
  end

  # GET /activities/new
  def new
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  def toggle_status

    if @activity.pending?
      @activity.approved!
    elsif @activity.approved?
      @activity.pending!
    end    

    #redirect_to activities_url
    redirect_to approval_list_url

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:time_from, :time_to, :detail, :remarks, :supervisor_comment,:sector_head_comment)
    end
end

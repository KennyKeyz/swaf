class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy, :toggle_status]
  
  before_action :authenticate_user!

  layout "main_template"





  # GET /activities
  # GET /activities.json
  def index
    @activities = Activity.where(user_id: current_user.id).order("created_at DESC")

    #@search = ActivitySearch.new(params[:search])
   # @activities = @search.scope
   #@activities = Activity.where('created_date BETWEEN ? AND ?',params[:time_from], params[:time_from]) 
     @user_activities = current_user.activities
     respond_to do |format|
    format.html
    format.pdf do
send_data generate_activities_report(@user_activities), filename: 'report.pdf',
type: 'application/pdf',
disposition: 'attachment'
end
end

    #@activities = Activity.where(user_id: User.where(id: '8'))

  end

  def approvals
    @approvals = Activity.where(user_id: User.where(department_id: current_user.department_id)).order("created_at DESC")



  end  

  

  def sectorapprovals
    @sectapprovals = Activity.where(user_id: User.where(sector_id: current_user.sector_id)).order("created_at DESC")

  end  


  def staffapproved
    @staffapproved = Activity.where(user_id: current_user.id , status:"approved").order("created_at DESC")

  end  

  def basereport



   

     @start_date = Chronic.parse(params["date_from"])
     @end_date = Chronic.parse(params["date_to"])

     Rails.logger.debug "Here's the date *** from #{@start_date}"

     Rails.logger.debug "Here's the date *** to #{@end_date}"

     Rails.logger.debug ":) #{Date.today}"

     @reportgen = Activity.where(created_at: @start_date..@end_date)
     #@user_activities = current_user.activities
     respond_to do |format|
      format.html
      format.pdf do
        send_data generate_activities_report(@reportgen), filename: 'report.pdf',
                                                          type: 'application/pdf',
                                                disposition: 'attachment'
           end
     end





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
    if current_user.ss_role?
      redirect_to approval_list_url
    elsif current_user.su_role?
      redirect_to sector_approval_list_url
    end  
      

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

    #def date_params
    #  params.permit(:date_from, :date_to)
    #end

    def generate_activities_report(activities)
            report = Thinreports::Report.new layout: File.join(Rails.root, 'app', 'reports', 'activity', 'list.tlf')

            activities.each do |activity|
            report.list.add_row do |row|
            row.values no: activity.id,
            staff: activity.user.first_name,
            department: activity.user.department.name,
            activity: activity.detail,
            remarks: activity.remarks,
            status: activity.status
            row.item(:status).style(:color, 'red') unless activity.approved?

            end
            end

            report.generate
            end


end

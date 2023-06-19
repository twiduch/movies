class GroupsController < ApplicationController
  before_action :authenticate_request
  before_action :set_group, only: %i[show edit update destroy activate]

  # GET /groups or /groups.json
  def index
    @groups = current_user.groups
  end

  # GET /groups/1 or /groups/1.json
  def show
    @movies = @group.movies
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit; end

  def activate
    current_user.update(active_group: @group)

    redirect_to action: :index
  end

  # POST /groups or /groups.json
  def create
    @group = Group.new(group_params)
    @group.user = current_user

    respond_to do |format|
      if @group.save
        format.html { redirect_to group_url(@group), notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to group_url(@group), notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    if @group.user.active_group == @group
      msg = { alert: 'Cannot destroy active group.' }
    else
      @group.destroy
      msg = { notice: 'Group was successfully destroyed.' }
    end

    respond_to do |format|
      format.html { redirect_to groups_url, msg }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = current_user.groups.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :description)
  end
end

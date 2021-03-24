class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy ]
  before_action :get_data
  before_action :authenticate_user!
  # GET /rooms or /rooms.json
  def index
    @rooms = Room.all
    render 'home/index'
  end

  # GET /rooms/1 or /rooms/1.json
  def show
    render 'home/index'
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms or /rooms.json
  def create
    @room = Room.new(room_params)
    user_id = @room.name
    current = current_user.id.to_s
    $name = if user_id < current
             "room_channel_#{user_id}#{current_user.id}"
           else
             "room_channel_#{current_user.id}#{user_id}"
           end
    @room = Room.find_by_name($name)
    if !@room.nil?
      render 'home/index'
    else
      @room = Room.new(name: $name)
      @room.save
      render 'home/index'
    end

  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: "Room was successfully updated." }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: "Room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_room
    @room = Room.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def room_params
    params.require(:room).permit(:name)
  end

  def get_data
    @users = User.all
    if user_signed_in?
      @user = current_user
      @users = User.where(["id != #{@user.id}"])
    end
  end
end

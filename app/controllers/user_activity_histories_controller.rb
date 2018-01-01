class UserActivityHistoriesController < ApplicationController
  before_action :set_user_activity_history, only: [:show, :edit, :update, :destroy]

  # GET /user_activity_histories
  # GET /user_activity_histories.json
  def index
    @user_activity_histories = UserActivityHistory.all
  end

  # GET /user_activity_histories/1
  # GET /user_activity_histories/1.json
  def show
  end

  # GET /user_activity_histories/new
  def new
    @user_activity_history = UserActivityHistory.new
  end

  # GET /user_activity_histories/1/edit
  def edit
  end

  # POST /user_activity_histories
  # POST /user_activity_histories.json
  def create
    @user_activity_history = UserActivityHistory.new(user_activity_history_params)

    respond_to do |format|
      if @user_activity_history.save
        format.html { redirect_to @user_activity_history, notice: 'User activity history was successfully created.' }
        format.json { render :show, status: :created, location: @user_activity_history }
      else
        format.html { render :new }
        format.json { render json: @user_activity_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_activity_histories/1
  # PATCH/PUT /user_activity_histories/1.json
  def update
    respond_to do |format|
      if @user_activity_history.update(user_activity_history_params)
        format.html { redirect_to @user_activity_history, notice: 'User activity history was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_activity_history }
      else
        format.html { render :edit }
        format.json { render json: @user_activity_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_activity_histories/1
  # DELETE /user_activity_histories/1.json
  def destroy
    @user_activity_history.destroy
    respond_to do |format|
      format.html { redirect_to user_activity_histories_url, notice: 'User activity history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_activity_history
      @user_activity_history = UserActivityHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_activity_history_params
      params.require(:user_activity_history).permit(:points_earned)
    end
end

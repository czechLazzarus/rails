class UserSmtpsController < ApplicationController
  before_action :set_user_smtp, only: %i[show edit update destroy]

  # GET /user_smtps
  # GET /user_smtps.json
  def index
    @user_smtps = UserSmtp.all
  end

  # GET /user_smtps/1
  # GET /user_smtps/1.json
  def show
  end

  # GET /user_smtps/new
  def new
    @user_smtp = UserSmtp.new
  end

  # GET /user_smtps/1/edit
  def edit
  end

  # POST /user_smtps
  # POST /user_smtps.json
  def create
    @user_smtp = UserSmtp.new(user_smtp_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @user_smtp.save
        format.html { redirect_to @user_smtp, notice: 'User smtp was successfully created.' }
        format.json { render :show, status: :created, location: @user_smtp }
      else
        format.html { render :new }
        format.json { render json: @user_smtp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_smtps/1
  # PATCH/PUT /user_smtps/1.json
  def update
    respond_to do |format|
      if @user_smtp.update(user_smtp_params.merge(user_id: current_user.id))
        format.html { redirect_to @user_smtp, notice: 'User smtp was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_smtp }
      else
        format.html { render :edit }
        format.json { render json: @user_smtp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_smtps/1
  # DELETE /user_smtps/1.json
  def destroy
    @user_smtp.destroy
    respond_to do |format|
      format.html { redirect_to user_smtps_url, notice: 'User smtp was successfully destroyed.'}
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user_smtp
    @user_smtp = UserSmtp.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_smtp_params
    params.require(:user_smtp).permit(:username, :smtp, :port, :protocol, :password, :email, :user_id)
  end
end

require 'base64'

# UserSmtp Controller
class UserSmtpsController < ApplicationController
  before_action :set_user_smtp, only: %i[edit update destroy]

  # GET /user_smtps
  # GET /user_smtps.json
  def index
    @user_smtps = UserSmtp.all
  end

  # GET /user_smtps/1
  # GET /user_smtps/1.json
  def show
    redirect_to action: "index"
  end

  # GET /user_smtps/new
  def new
    @user_smtp = UserSmtp.new
  end

  # POST /user_smtps
  # POST /user_smtps.json
  def create
    @user_smtp = UserSmtp.new(user_smtp_params.merge(user_id: current_user.id))
    @user_smtp.password= Base64.encode64(@user_smtp.password)
    respond_to do |format|
      if @user_smtp.save
        format.html { redirect_to user_smtps_url, notice: 'User smtp was created.' }
        format.json { render :index, status: :created }
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
      base64_password = Base64.encode64(user_smtp_params['password'])
      if @user_smtp.update(user_smtp_params.merge(password: base64_password))
        format.html { redirect_to user_smtps_url, notice: 'User smtp was updated.' }
        format.json { render :index, status: :ok }
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
      format.html { redirect_to user_smtps_url, notice: 'User smtp was destroyed.'}
      format.json { head :no_content }
    end
  end

  private

  def set_user_smtp
    @user_smtp = UserSmtp.find(params[:id])
  end

  def user_smtp_params
    params.require(:user_smtp).permit(:username, :smtp, :port, :protocol, :password, :email, :user_id)
  end
end

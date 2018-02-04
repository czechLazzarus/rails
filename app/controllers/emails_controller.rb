class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :edit, :update, :destroy]
  include EmailsHelper
  # GET /emails
  # GET /emails.json
  def index
    @emails = Email.all
  end

  # GET /emails/1
  # GET /emails/1.json
  def show
  end

  # GET /emails/new
  def new
    @email = Email.new
  end

  # GET /emails/1/edit
  def edit
  end

  # POST /emails
  # POST /emails.json
  def create
    @email = Email.new
    migrate_template_to_email
    respond_to do |format|
      if @email.save
        build_emails
        format.html {redirect_to @email, notice: 'Email was successfully created.'}
        format.json {render :show, status: :created, location: @email}
      else
        format.html {render :new}
        format.json {render json: @email.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /emails/1
  # PATCH/PUT /emails/1.json
  def update
    remove_email_dependencies
    migrate_template_to_email
    respond_to do |format|
      if @email.save
        build_emails
        format.html {redirect_to @email, notice: 'Email was successfully updated.'}
        format.json {render :index, status: :ok }
      else
        format.html {render :edit}
        format.json {render json: @email.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /emails/1
  # DELETE /emails/1.json
  def destroy
    remove_email_dependencies
    @email.destroy
    respond_to do |format|
      format.html {redirect_to emails_url, notice: 'Email was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  def migrate_template_to_email
    @email_template = EmailTemplate.find(email_params[:email_template_id])
    @email.fill_email_by_template(@email_template, current_user.id)
  end

  def build_emails
    @categoriesTemplates = CategoriesEmailTemplate.where(:email_template_id => @email_template.id)
    @categoriesTemplates.collect do |value|
      @contactCategory = CategoriesContact.where(:category_id => value.category_id)
      @contactCategory.collect do |value2|
        unless ContactsEmail.where(:contact_id => value2.contact_id, :email_id => @email.id).any?
          @contactEmail = ContactsEmail.new
          @contactEmail.contact_id = value2.contact_id
          @contactEmail.email_id = @email.id
          @contactEmail.user_id = current_user.id
          @contactEmail.sended = false
          @contactEmail.error = false
          @contactEmail.save
        end
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_email
    @email = Email.find(params[:id])
  end

  def remove_email_dependencies
    ContactsEmail.where(email_id: @email.id).destroy_all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def email_params
    params.require(:email).permit(:email_template_id)
  end
end

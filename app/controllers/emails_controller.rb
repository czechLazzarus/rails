#Email Controller
class EmailsController < ApplicationController
  before_action :set_email, only: [:edit, :update, :destroy]
  include EmailsHelper
  # GET /emails
  # GET /emails.json
  def index
    @emails = Email.paginate(page: params[:page], per_page: 10)
  end

  # GET /emails/1
  # GET /emails/1.json
  def show
    redirect_to action: "edit"
  end

  # GET /emails/new
  def new
    @email = Email.new
  end

  # POST /emails
  # POST /emails.json
  def create
    @email = Email.new
    migrate_template_to_email
    respond_to do |format|
      if @email.save
        build_emails
        format.html {redirect_to emails_url, notice: 'Email was successfully created.'}
        format.json {render :index, status: :created}
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
        format.html {redirect_to emails_url, notice: 'Email was updated.'}
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
      format.html { redirect_to emails_url, notice: 'Email was destroyed.' }
      format.json { head :no_content }
    end
  end

  def migrate_template_to_email
    @email_template = EmailTemplate.find(email_params[:email_template_id])
    @email.fill_email_by_template(@email_template, current_user.id)
  end

  def build_emails
    @categories_templates = CategoriesEmailTemplate.where(email_template_id: @email_template.id)
    @categories_templates.collect do |value|
      @contact_category = CategoriesContact.where(category_id: value.category_id)
      @contact_category.collect do |value2|
        unless ContactsEmail.where(contact_id: value2.contact_id, email_id: @email.id).any?
          @contact_email = ContactsEmail.new
          @contact_email.contact_id = value2.contact_id
          @contact_email.email_id = @email.id
          @contact_email.user_id = current_user.id
          @contact_email.sended = false
          @contact_email.error = false
          @contact_email.save
        end
      end
    end
  end

  private

  def set_email
    @email = Email.find(params[:id])
  end

  def remove_email_dependencies
    ContactsEmail.where(email_id: @email.id).destroy_all
  end
  
  def email_params
    params.require(:email).permit(:email_template_id)
  end
end

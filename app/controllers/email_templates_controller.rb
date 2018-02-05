# Email template Controller
class EmailTemplatesController < ApplicationController
  before_action :set_email_template, only: %i[edit update destroy]

  # GET /email_templates
  # GET /email_templates.json
  def index
    @email_templates = EmailTemplate.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    redirect_to action: 'edit'
  end

  # GET /email_templates/new
  def new
    @email_template = EmailTemplate.new
  end

  # GET /email_templates/1/edit
  def edit
    @email = EmailTemplate.find(params[:id])
  end


  # POST /email_templates
  # POST /email_templates.json
  def create
    @email_template = EmailTemplate.new(email_template_params.merge(user_id: current_user.id))
    respond_to do |format|
      if @email_template.save
        update_contact_category
        format.html { redirect_to @email_template, notice: 'Email template was created.' }
      else
        format.html { render :new }
        format.json { render json: @email_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /email_templates/1
  # PATCH/PUT /email_templates/1.json
  def update
    respond_to do |format|
      if @email_template.update(email_template_params)
        update_contact_category
        format.html { redirect_to @email_template, notice: 'Email template was updated.' }
      else
        format.html { render :edit }
        format.json { render json: @email_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_templates/1
  # DELETE /email_templates/1.json
  def destroy
    @email_template.destroy
    respond_to do |format|
      format.html { redirect_to email_templates_url, notice: 'Email template was destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_email_template
    @email_template = EmailTemplate.find(params[:id])
  end

  def remove_email_template_dependencies
    CategoriesEmailTemplate.where(email_template_id: @email_template.id).delete_all
  end

  def email_template_params
    params.require(:email_template).permit(:subject, :text, :sender)
  end

  def email_template_category_params
    params.require(:email_template).permit(email_template_category: [])
  end

  def update_contact_category
    remove_email_template_dependencies
    email_template_category_params['email_template_category'].each do |value|
      unless value == '0'
        @CategoriesEmailTemplate = CategoriesEmailTemplate.new(email_template_id: @email_template.id, category_id: value)
        @CategoriesEmailTemplate.save
      end
    end
  end
end

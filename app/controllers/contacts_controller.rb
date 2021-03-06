class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show edit update destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.paginate(page: params[:page], per_page: 10)
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    redirect_to action: 'edit'
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)
    respond_to do |format|
      if @contact.save
        update_contact_category
        format.html { redirect_to contacts_url, notice: 'Contact was created.' }
        format.json { render :index, status: :created }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        update_contact_category
        format.html { redirect_to contacts_url, notice: 'Contact was updated.' }
        format.json { render :index, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    remove_contacts_dependencies
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def remove_contacts_dependencies
    CategoriesContact.where(contact_id: @contact.id).delete_all
  end

  def contact_params
    params.require(:contact).permit(:surname, :name, :email, :category_id)
  end

  def contact_category_params
    params.require(:contact).permit(contact_category: [])
  end

  def update_contact_category
    remove_contacts_dependencies
    contact_category_params['contact_category'].each do |value|
      unless value == '0'
        CategoriesContact.new(contact_id: @contact.id, category_id: value).save
      end
    end
  end
end

require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:testuser)
    post login_path, params: { session: { username:  @user.username, password: '123456' } }
    @contact = contacts(:two)
  end

  test "should get index" do
    get contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_contact_url
    assert_response :success
  end

  test "should create contact" do
    assert_difference('Contact.count') do
      post contacts_url, params: { contact: { email: 'test4@test.com', name: 'vejr', surname: 'jakub', contact_category: ["0", "0"] } }
    end

    assert_redirected_to contacts_url
  end

  test "should get edit" do
    get edit_contact_url(@contact)
    assert_response :success
  end

  test "should update contact" do
    patch contact_url(@contact), params: { contact: { email: @contact.email, name: @contact.name, surname: @contact.surname, contact_category: ["0", "0"] } }
    assert_redirected_to contacts_url
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete contact_url(@contact)
    end

    assert_redirected_to contacts_url
  end
end

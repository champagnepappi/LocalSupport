require 'spec_helper'

describe "organizations/new.html.erb" do
  before(:each) do
    assign(:organization, stub_model(Organization,
      :name => "MyString",
      :address => "MyString",
      :postcode => "MyString",
      :email => "MyString",
      :description => "MyString",
      :website => "",
      :telephone => "MyString"
    ).as_new_record)
  end

  it "renders new organization form" do
    view.lookup_context.prefixes = %w[organizations application]

    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => organizations_path, :method => "post" do
      assert_select "input#organization_name", :name => "organization[name]"
      assert_select "input#organization_address", :name => "organization[address]"
      assert_select "input#organization_postcode", :name => "organization[postcode]"
      assert_select "input#organization_email", :name => "organization[email]"
      assert_select "input#organization_description", :name => "organization[description]"
      assert_select "input#organization_website", :name => "organization[website]"
      assert_select "input#organization_telephone", :name => "organization[telephone]"
    end
  end
end

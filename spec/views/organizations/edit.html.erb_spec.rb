require 'spec_helper'

describe "organizations/edit.html.erb" do
  before(:each) do
    @organization = assign(:organization, stub_model(Organization,
      :new_record? => false,
      :name => "MyString",
      :address => "MyString",
      :postcode => "MyString",
      :email => "MyString",
      :description => "MyString",
      :website => "",
      :telephone => "MyString"
    ))
  end

  it "renders the edit organization form" do
    view.lookup_context.prefixes = %w[organizations application]
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => organization_path(@organization), :method => "post" do
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

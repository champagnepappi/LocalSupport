require 'spec_helper'

describe "organizations/index.html.erb" do
  before(:each) do
    assign(:organizations, [
      stub_model(Organization,
        :name => "Name",
        :address => "Address",
        :postcode => "Postcode",
        :email => "Email",
        :description => "Description",
        :website => "",
        :telephone => "Telephone"
      ),
      stub_model(Organization,
        :name => "Name",
        :address => "Address",
        :postcode => "Postcode",
        :email => "Email",
        :description => "Description",
        :website => "",
        :telephone => "Telephone"
      )
    ])
  end

  it "shows a search form" do
    render
    assert_select "form"
    assert_select "form input", 3
    assert_select "form input" do
      assert_select "[name=?]", 'q'  
    end

  end

  it "renders a list of organizations" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Postcode".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Telephone".to_s, :count => 2
  end
end

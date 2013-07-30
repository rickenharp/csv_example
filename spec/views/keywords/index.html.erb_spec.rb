require 'spec_helper'

describe "keywords/index" do
  before(:each) do
    assign(:keywords, [
      stub_model(Keyword,
        :value => "Value",
        :brand => "Brand",
        :category => "Category",
        :target_url => "Target Url"
      ),
      stub_model(Keyword,
        :value => "Value",
        :brand => "Brand",
        :category => "Category",
        :target_url => "Target Url"
      )
    ])
  end

  it "renders a list of keywords" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Value".to_s, :count => 2
    assert_select "tr>td", :text => "Brand".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "Target Url".to_s, :count => 2
  end
end

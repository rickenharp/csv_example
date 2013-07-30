require 'spec_helper'

describe "keywords/show" do
  before(:each) do
    @keyword = assign(:keyword, stub_model(Keyword,
      :value => "Value",
      :brand => "Brand",
      :category => "Category",
      :target_url => "Target Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Value/)
    rendered.should match(/Brand/)
    rendered.should match(/Category/)
    rendered.should match(/Target Url/)
  end
end

require 'spec_helper'

describe "keywords/new" do
  before(:each) do
    assign(:keyword, stub_model(Keyword,
      :value => "MyString",
      :brand => "MyString",
      :category => "MyString",
      :target_url => "MyString"
    ).as_new_record)
  end

  it "renders new keyword form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", keywords_path, "post" do
      assert_select "input#keyword_value[name=?]", "keyword[value]"
      assert_select "input#keyword_brand[name=?]", "keyword[brand]"
      assert_select "input#keyword_category[name=?]", "keyword[category]"
      assert_select "input#keyword_target_url[name=?]", "keyword[target_url]"
    end
  end
end

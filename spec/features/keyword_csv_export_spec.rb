require 'spec_helper'

describe "CSV export" do

  before do
    new_time = Time.local(2008, 9, 1, 12, 0, 0)
    Timecop.freeze(new_time)
  end

  after do
    Timecop.return
  end

  it "As a user I can export keywords as CSV" do
    keyword1 = FactoryGirl.create(:keyword, value: "adidas shoes", brand: "Adidas", category: "shoes", target_url: "http://example.com/adidas/shoes")
    keyword2 = FactoryGirl.create(:keyword, value: "adidas shirts", brand: "Adidas", category: "shirts", target_url: "http://example.com/adidas/shirts")
    visit "/keywords.csv"
    expected_csv = ""
    expected_csv += "id\tvalue\tbrand\tcategory\ttarget_url\tcreated_at\tupdated_at\n"
    expected_csv += "#{keyword1.id}\tadidas shoes\tAdidas\tshoes\thttp://example.com/adidas/shoes\t2008-09-01 10:00:00 UTC\t2008-09-01 10:00:00 UTC\n"
    expected_csv += "#{keyword2.id}\tadidas shirts\tAdidas\tshirts\thttp://example.com/adidas/shirts\t2008-09-01 10:00:00 UTC\t2008-09-01 10:00:00 UTC\n"

    expect(page.body).to eq(expected_csv)
  end
  
end

require "spec_helper"

describe CSVExportService do

  let(:keyword1) { double("keyword1", :value => "adidas shoes", :brand => "adidas", :category => "shoes")}
  let(:keyword2) { double("keyword2", :value => "adidas shirts", :brand => "adidas", :category => "shirts")}
  let(:exportable) do
    double("Exportable",
           :to_a => [keyword1, keyword2],
           :columns_hash => {:value => "", :brand => "", :category => ""},
          )
  end

  context "initialize" do
    it "takes one argument" do
      expect{ CSVExportService.new  }.to raise_error(ArgumentError)
      expect{ CSVExportService.new(exportable)  }.to_not raise_error()
    end
  end

  context "call" do
    it "returns a string" do
      export_service = CSVExportService.new(exportable)
      expect(export_service.call).to be_kind_of(String)
    end

    it "returns the correct CSV" do
      export_service = CSVExportService.new(exportable)
      expected_csv  = "value\tbrand\tcategory\n"
      expected_csv += "adidas shoes\tadidas\tshoes\n"
      expected_csv += "adidas shirts\tadidas\tshirts\n"
      expect(export_service.call).to eq(expected_csv)
    end

    it "returns the CSV for a subset of fields" do
      export_service = CSVExportService.new(exportable, [:value, :brand])
      expected_csv  = "value\tbrand\n"
      expected_csv += "adidas shoes\tadidas\n"
      expected_csv += "adidas shirts\tadidas\n"
      expect(export_service.call).to eq(expected_csv)
      
    end
  end
end

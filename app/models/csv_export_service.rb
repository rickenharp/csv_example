require 'csv'

class CSVExportService

  def initialize(exportable)
    @exportable = exportable
    @headers = @exportable.columns_hash.keys
  end

  def call
    CSV.generate(:col_sep => "\t") do |csv|
      csv << headers
      @exportable.to_a.each do |item|
        csv << map_object_to_array(item)
      end
    end
  end

  private

  def headers
    @headers
  end


  def map_object_to_array(object)
    @headers.map{|field| object.public_send(field)}
  end
end

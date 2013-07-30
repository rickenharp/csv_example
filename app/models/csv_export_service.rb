require 'csv'

class CSVExportService

  def initialize(exportable, wanted_fields = [])
    @exportable = exportable
    @wanted_fields = wanted_fields
  end

  def call
    CSV.generate(:col_sep => "\t") do |csv|
      csv << header
      @exportable.to_a.each do |item|
        csv << map_object_to_array(item)
      end
    end
  end

  private

  def header
    @header ||= wanted_fields
  end

  def wanted_fields
    if @wanted_fields.empty?
      @exportable.columns_hash.keys
    else
      @exportable.columns_hash.keys & @wanted_fields
    end
  end

  def map_object_to_array(object)
    @header.map{|field| object.public_send(field)}
  end
end

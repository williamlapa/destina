class ProductsImport
  include ActiveModel::Model
  require 'roo'

  attr_accessor :file

  def initialize(attributes = {})
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def persisted?
    false
  end

  def open_spreadsheet
    case File.extname(file.original_filename)
    when ".csv" then Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def load_imported_products
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(4)
    (5..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      product = Product.find_by_id(row["id"]) || Product.new
      product.attributes = row.to_hash
      product
    end
  end

  def imported_products
    @imported_products ||= load_imported_products
  end

  def save
    if imported_products.map(&:valid?).all?
      imported_products.each(&:save!)
      true
    else
      imported_products.each_with_index do |product, index|
        product.errors.full_messages.each do |msg|
          errors.add :base, "Row #{index + 5}: #{msg}"
        end
      end
      false
    end
  end
end

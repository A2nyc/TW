require './lib/input'
require './lib/cal'
require './lib/print'

class SalesTax

  def initialize(filename)
    @filename = filename
  end

  def input
    file = Input.new(@filename)
    file.parse
    return file
  end

  def print
    Print.review(input.input_file, @filename)
    receipt = Print.new(calc.items, calc.total_sales_tax, calc.total_price)
    receipt.show
  end

  def calc
    costs = Calculator.new(input.items)
    costs.total_all
    return costs
  end

  def execute
    input
    calc
    print
  end
end

filename = ARGV.first
purchase = SalesTax.new(filename)
purchase.execute

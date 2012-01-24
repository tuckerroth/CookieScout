require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "is Invalid Without Title" do
    p = Product.new
    p.price = 3
    p.title = nil

    assert !p.valid?
  end

  test "is Invalid Without Price" do
    p = Product.new
    p.price = nil
    p.title = "Samoa"

    assert !p.valid?
  end

  test "is valid With Price and Title" do
    p = Product.new
    p.price = 5.50
    p.title = "Samoa"

    assert p.valid?
  end

end

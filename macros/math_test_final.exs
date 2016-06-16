defmodule MathTest do
  use Assertion

  test "integers can be added and subtracted" do
    assert 2 + 3 == 5
    assert 5 - 5 == 10
  end

  test "integers can be multiplied and divied" do
    assert 5 * 5 == 25
    assert 10 /2 == 5
  end
end

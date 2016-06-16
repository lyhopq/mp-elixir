defmodule Assertion do
  # {:==, [context: Elixir, import: Kernel], [5, 5]}
  defmacro assert({opetator, _, [lhs, rhs]}) do
    quote bind_quoted: [opetator: opetator, lhs: lhs, rhs: rhs] do
      Assertion.Test.assert(opetator, lhs, rhs)
    end
  end
end

defmodule Assertion.Test do
  def assert(:==, lhs, rhs) when lhs == rhs do
    IO.write "."
  end
  def assert(:==, lhs, rhs) do
    IO.puts """
    FAILURE:
      Expected:       #{lhs}
      to be equal to: #{rhs}
    """
  end

  def assert(:>, lhs, rhs) when lhs > rhs do
    IO.write "."
  end
  def assert(:>, lhs, rhs) do
    IO.puts """
    FAILURE:
      Expected:           #{lhs}
      to be greater than: #{rhs}
    """
  end
end

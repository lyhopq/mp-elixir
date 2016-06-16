defmodule Assertion do
  # {:==, [context: Elixir, import: Kernel], [5, 5]}
  defmacro assert({opetator, _, [lhs, rhs]}) do
    quote bind_quoted: [opetator: opetator, lhs: lhs, rhs: rhs] do
      Assertion.Test.assert(opetator, lhs, rhs)
    end
  end

end

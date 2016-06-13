defmodule ControlFlow do
  defmacro unless(exp, do: block) do
    quote do
      if ! unquote(exp), do: unquote(block)
    end
  end
end

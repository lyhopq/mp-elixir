defmodule Debugger do
  defmacro log(expr) do
    if Application.get_env(:debugger, :log_level) == :debug do
      quote do
        IO.puts "============================"
        IO.inspect unquote(expr)
        IO.puts "============================"
        unquote(expr)
      end
    else
      expr
    end
  end
end

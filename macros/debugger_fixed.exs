defmodule Debugger do
  defmacro log(expr) do
    if Application.get_env(:debugger, :log_level) == :debug do
      quote bind_quoted: [expr: expr] do
        IO.puts "============================"
        IO.inspect expr
        IO.puts "============================"
        expr
      end
    else
      expr
    end
  end
end

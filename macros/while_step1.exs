defmodule Loop do

  defmacro while(exp, do: block) do
    quote do
      for _ <- Stream.cycle([:ok]) do
        if unquote(exp) do
          unquote(block)
        else
          # break out of loop
        end
      end
    end
  end

end

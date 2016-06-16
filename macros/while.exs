defmodule Loop do

  defmacro while(exp, do: block) do
    quote do
      try do
        for _ <- Stream.cycle([:ok]) do
          if unquote(exp) do
            unquote(block)
          else
            throw :break
          end
        end
      catch
        :break -> :ok
      end
    end
  end

  def break, do: throw :break
end

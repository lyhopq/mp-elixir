defmodule Mime do
  @external_resource mimes_path = Path.join([__DIR__, "mimes.txt"])

  defmacro __using__(options) do
    compile(unquote(mimes_path), options)
  end

  defp compile(mimes_path, options) do
    ast = for line <- File.stream!(mimes_path, [], :line) do
      [type, rest] = line |> String.split("\t") |> Enum.map(&String.strip(&1))
      extensions = String.split(rest, ~r/,\s?/)

      def_mime_fun(type, extensions)
    end

    append_ast = for {type, extensions} <- options do
      def_mime_fun(to_string(type), extensions)
    end

    final_ast = quote do
      unquote(ast)
      unquote(append_ast)

      def exts_from_type(_type), do: []
      def type_from_ext(_ext), do: nil
      def valid_type?(type), do: exts_from_type(type) |> Enum.any?
    end

    final_ast
  end

  defp def_mime_fun(type, extensions) do
    quote do
      def exts_from_type(unquote(type)), do: unquote(extensions)
      def type_from_ext(ext) when ext in unquote(extensions), do: unquote(type)
    end
  end
end

defmodule Fily.GraphQl.Resolvers do
  alias Fily.Impl
  
  def fetch_all_uploads(_, _, _) do

    {:ok, Impl.list_of_uploads()}
  end

  def upload_file(_, args, _) do
    IO.puts("this is the args")
    IO.inspect(args)
    {:ok, Impl.upload_file(args)}
  end

    
end

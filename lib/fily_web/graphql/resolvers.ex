defmodule Fily.GraphQl.Resolvers do
  alias Fily.Impl
  
  alias Fily.ObanWorker
  
  def fetch_all_uploads(_, _, _) do

    {:ok, Impl.list_of_uploads()}
  end

  def upload_file(args) do
     
    ObanWorker.new(args) |> Oban.insert()
    Oban.drain_queue(queue: :batch)
    
    {:ok, Map.new([message: "file queued for upload"])}
    
  end

    
end

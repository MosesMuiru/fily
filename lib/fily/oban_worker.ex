defmodule Fily.ObanWorker do
  use Oban.Worker, queue: :batch
  alias Fily.Impl

  @impl true
  def perform(%Oban.Job{args: args}) do
    
    {:ok, file} = Impl.upload_file(args)
    
    {:ok, file}
  end

end

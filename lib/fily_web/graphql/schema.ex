defmodule Fily.GraphQl.Schema do
  use Absinthe.Schema

  alias Fily.GraphQl.Resolvers


  object :file do
    field :file_name, :string
    field :updated_at, :datetime
  end
  
  object :uploads do
    field :id, :integer
    field :file_name, :string
    field :the_file, :file
  end

  scalar :datetime do
    parse fn input ->
      case DateTime.from_iso8601(input.value) do
        {:ok, datetime} -> {:ok, datetime}
        _ -> :error
      end
    end

    serialize fn datetime ->
      DateTime.from_naive!(datetime, "Etc/UTC")
      |> DateTime.to_iso8601()
    end
  end

  query do
    @desc "list of files uploaded"
    field :get_all_uploads, list_of(:uploads) do
      resolve(&Resolvers.fetch_all_uploads/3)
    end
  end

  mutation do
  
    @desc "filename - name of the file, the_file - the file path"
    field :upload_file, :uploads do
      arg :file_name, :string
      arg :the_file, :string
      resolve fn args,_ -> Fily.Impl.upload_file(args) end
    end
  end
end

defmodule Fily.GraphQl.Schema do

  use Absinthe.Schema

  object :uploads do
    field :id, non_null(:integer)
    field :filename, non_null(:string)
    field :the_file, non_null(:string)
  end

  query do

    @desc "list of files uploaded"
    field :files, list_of(:uploads) do

    end
  end
end

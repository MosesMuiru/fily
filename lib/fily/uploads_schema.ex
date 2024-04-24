defmodule Fily.UploadsSchema do
  use Ecto.Schema
  use Waffle.Ecto.Schema

  import Ecto.Changeset


  schema "uploads" do

    field :filename, :string
    field :the_file, Fily.Uploaders.FileUploader.Type 

    timestamps()
    
  end

  def changeset(post, params) do
    post
    |> cast(params, [:filename])
    |> cast_attachments(params, [:the_file])
  end
  
end

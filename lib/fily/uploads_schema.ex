defmodule Fily.UploadsSchema do
  use Ecto.Schema
  use Waffle.Ecto.Schema

  import Ecto.Changeset


  schema "uploads" do

    field :file_name, :string
    field :the_file, Fily.Uploaders.FileUploader.Type 

  end

  def changeset(post, params) do
    post
    |> cast(params, [:file_name])
    |> cast_attachments(params, [:the_file], allow_paths: true)
  end
  
end

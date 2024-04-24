defmodule Fily.Impl do
  alias Fily.Repo

  alias Fily.UploadsSchema
  # list of all uploads

  @spec list_of_uploads :: list(%UploadsSchema{})
  def list_of_uploads do
    Repo.all(UploadsSchema)  
  end

  @type file_details :: %{file_name: String.t(), the_file: String.t()}
  @spec upload_file(file_details) :: %UploadsSchema{}
  def upload_file(file_details) do
    %UploadsSchema{}
    |> UploadsSchema.changeset(file_details)
    |> Repo.insert()
    
  end

end

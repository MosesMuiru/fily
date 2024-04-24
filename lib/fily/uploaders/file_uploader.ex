defmodule Fily.Uploaders.FileUploader do

  use Waffle.Definition
  use Waffle.Ecto.Definition

  @allowed_ext ~w(.png .jpg .jpeg .pdf .txt)

  def validate({file, _scope}) do
    file_extension =
      file.file_name
      |> Path.extname()
      |> String.downcase()

    Enum.member?(@allowed_ext, file_extension) 
  end
end

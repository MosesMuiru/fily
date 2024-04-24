defmodule Fily.Uploaders.FileUploader do

  use Waffle.Definition
  use Waffle.Ecto.Definition

  @allowed_ext ~w(.png .jpg .jpeg .pdf )

  def filename(version, {file, post}) do


    "#{file.file_name}_#{post.title}_#{version}"
  end

  def validate(_version, {file, _scope}) do
    file_extension =
       file.file_filename
      |> Path.extname()
      |> String.downcase()

    Enum.member?(@allowed_ext, file_extension)
  end

end

defmodule Fily.Repo.Migrations.CreateFileUploads do
  use Ecto.Migration

  def change do
    create table(:uploads) do
      add :file_name, :string, null: false
      add :the_file, :string, null: false 
    end

  end
end

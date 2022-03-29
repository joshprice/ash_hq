defmodule AshHq.Repo.Migrations.MigrateResources3 do
  @moduledoc """
  Updates resources based on their most recent snapshots.

  This file was autogenerated with `mix ash_postgres.generate_migrations`
  """

  use Ecto.Migration

  def up do
    create table(:guides, primary_key: false) do
      add :id, :uuid, null: false, primary_key: true
      add :order, :bigint, null: false
      add :name, :text, null: false
      add :text, :text, null: false

      add :library_version_id,
          references(:library_versions,
            column: :id,
            name: "guides_library_version_id_fkey",
            type: :uuid
          ),
          null: false
    end
  end

  def down do
    drop constraint(:guides, "guides_library_version_id_fkey")

    drop table(:guides)
  end
end
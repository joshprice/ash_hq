defmodule AshHq.Repo.Migrations.MigrateResources16 do
  @moduledoc """
  Updates resources based on their most recent snapshots.

  This file was autogenerated with `mix ash_postgres.generate_migrations`
  """

  use Ecto.Migration

  def up do
    alter table(:options) do
      remove :sanitized_name

      add :sanitized_path, :text, null: false
    end

    alter table(:dsls) do
      remove :sanitized_name

      add :sanitized_path, :text, null: false
    end
  end

  def down do
    alter table(:dsls) do
      remove :sanitized_path
      add :sanitized_name, :text, null: false
    end

    alter table(:options) do
      remove :sanitized_path
      add :sanitized_name, :text, null: false
    end
  end
end
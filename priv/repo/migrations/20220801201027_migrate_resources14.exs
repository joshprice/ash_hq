defmodule AshHq.Repo.Migrations.MigrateResources14 do
  @moduledoc """
  Updates resources based on their most recent snapshots.

  This file was autogenerated with `mix ash_postgres.generate_migrations`
  """

  use Ecto.Migration

  def up do
    alter table(:options) do
      add :sanitized_name, :text
    end

    alter table(:modules) do
      add :sanitized_name, :text
    end

    alter table(:library_versions) do
      add :sanitized_version, :text
    end

    alter table(:guides) do
      add :sanitized_name, :text
    end

    alter table(:functions) do
      add :sanitized_name, :text
    end

    alter table(:extensions) do
      add :sanitized_name, :text
    end

    alter table(:dsls) do
      add :sanitized_name, :text
    end
  end

  def down do
    alter table(:dsls) do
      remove :sanitized_name
    end

    alter table(:extensions) do
      remove :sanitized_name
    end

    alter table(:functions) do
      remove :sanitized_name
    end

    alter table(:guides) do
      remove :sanitized_name
    end

    alter table(:library_versions) do
      remove :sanitized_version
    end

    alter table(:modules) do
      remove :sanitized_name
    end

    alter table(:options) do
      remove :sanitized_name
    end
  end
end
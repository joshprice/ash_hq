defmodule AshHq.Repo.Migrations.MigrateResources15 do
  @moduledoc """
  Updates resources based on their most recent snapshots.

  This file was autogenerated with `mix ash_postgres.generate_migrations`
  """

  use Ecto.Migration

  def up do
    alter table(:options) do
      modify :sanitized_name, :text, null: false
    end

    alter table(:modules) do
      modify :sanitized_name, :text, null: false
    end

    alter table(:library_versions) do
      modify :sanitized_version, :text, null: false
    end

    alter table(:guides) do
      modify :sanitized_name, :text, null: false
    end

    alter table(:functions) do
      modify :sanitized_name, :text, null: false
    end

    alter table(:extensions) do
      modify :sanitized_name, :text, null: false
    end

    alter table(:dsls) do
      modify :sanitized_name, :text, null: false
    end
  end

  def down do
    alter table(:dsls) do
      modify :sanitized_name, :text, null: true
    end

    alter table(:extensions) do
      modify :sanitized_name, :text, null: true
    end

    alter table(:functions) do
      modify :sanitized_name, :text, null: true
    end

    alter table(:guides) do
      modify :sanitized_name, :text, null: true
    end

    alter table(:library_versions) do
      modify :sanitized_version, :text, null: true
    end

    alter table(:modules) do
      modify :sanitized_name, :text, null: true
    end

    alter table(:options) do
      modify :sanitized_name, :text, null: true
    end
  end
end
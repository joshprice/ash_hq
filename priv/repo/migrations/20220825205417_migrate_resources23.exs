defmodule AshHq.Repo.Migrations.MigrateResources23 do
  @moduledoc """
  Updates resources based on their most recent snapshots.

  This file was autogenerated with `mix ash_postgres.generate_migrations`
  """

  use Ecto.Migration

  def up do
    # alter table(:modules) do
    # Attribute removal has been commented out to avoid data loss. See the migration generator documentation for more
    # If you uncomment this, be sure to also uncomment the corresponding attribute *addition* in the `down` migration
    # remove :category_index
    # 
    # end
    # 
  end

  def down do
    # alter table(:modules) do
    # This is the `down` migration of the statement:
    #
    #     remove :category_index
    #
    # 
    # add :category_index, :bigint, null: false, default: 0
    # end
    # 
  end
end
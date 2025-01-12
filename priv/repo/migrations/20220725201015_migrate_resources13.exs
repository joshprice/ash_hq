defmodule AshHq.Repo.Migrations.MigrateResources13 do
  @moduledoc """
  Updates resources based on their most recent snapshots.

  This file was autogenerated with `mix ash_postgres.generate_migrations`
  """

  use Ecto.Migration

  def up do
    alter table(:options) do
      add :links, :map
    end

    execute("""
    CREATE INDEX dsls_name_lower_index ON dsls(lower(name));
    """)

    execute("""
    CREATE INDEX dsls_name_trigram_index ON dsls USING GIST (name gist_trgm_ops);
    """)

    execute("""
    CREATE INDEX dsls_search_index ON dsls USING GIN((
      setweight(to_tsvector('english', name), 'A') ||
      setweight(to_tsvector('english', doc), 'D')
    ));
    """)

    execute("""
    CREATE INDEX extensions_name_lower_index ON extensions(lower(name));
    """)

    execute("""
    CREATE INDEX extensions_name_trigram_index ON extensions USING GIST (name gist_trgm_ops);
    """)

    execute("""
    CREATE INDEX extensions_search_index ON extensions USING GIN((
      setweight(to_tsvector('english', name), 'A') ||
      setweight(to_tsvector('english', doc), 'D')
    ));
    """)

    execute("""
    CREATE INDEX functions_name_lower_index ON functions(lower(name));
    """)

    execute("""
    CREATE INDEX functions_name_trigram_index ON functions USING GIST (name gist_trgm_ops);
    """)

    execute("""
    CREATE INDEX functions_search_index ON functions USING GIN((
      setweight(to_tsvector('english', name), 'A') ||
      setweight(to_tsvector('english', doc), 'D')
    ));
    """)

    execute("""
    CREATE INDEX guides_name_lower_index ON guides(lower(name));
    """)

    execute("""
    CREATE INDEX guides_name_trigram_index ON guides USING GIST (name gist_trgm_ops);
    """)

    execute("""
    CREATE INDEX guides_search_index ON guides USING GIN((
      setweight(to_tsvector('english', name), 'A') ||
      setweight(to_tsvector('english', text), 'D')
    ));
    """)

    execute("""
    CREATE INDEX library_versions_name_lower_index ON library_versions(lower(version));
    """)

    execute("""
    CREATE INDEX library_versions_name_trigram_index ON library_versions USING GIST (version gist_trgm_ops);
    """)

    execute("""
    CREATE INDEX library_versions_search_index ON library_versions USING GIN((
      to_tsvector('english', version)
    ));
    """)

    execute("""
    CREATE INDEX modules_name_lower_index ON modules(lower(name));
    """)

    execute("""
    CREATE INDEX modules_name_trigram_index ON modules USING GIST (name gist_trgm_ops);
    """)

    execute("""
    CREATE INDEX modules_search_index ON modules USING GIN((
      setweight(to_tsvector('english', name), 'A') ||
      setweight(to_tsvector('english', doc), 'D')
    ));
    """)

    execute("""
    CREATE INDEX options_name_lower_index ON options(lower(name));
    """)

    execute("""
    CREATE INDEX options_name_trigram_index ON options USING GIST (name gist_trgm_ops);
    """)

    execute("""
    CREATE INDEX options_search_index ON options USING GIN((
      setweight(to_tsvector('english', name), 'A') ||
      setweight(to_tsvector('english', doc), 'D')
    ));
    """)
  end

  def down do
    execute("""
    DROP INDEX options_search_index;
    """)

    execute("""
    DROP INDEX options_name_trigram_index;
    """)

    execute("""
    DROP INDEX options_name_lower_index;
    """)

    execute("""
    DROP INDEX modules_search_index;
    """)

    execute("""
    DROP INDEX modules_name_trigram_index;
    """)

    execute("""
    DROP INDEX modules_name_lower_index;
    """)

    execute("""
    DROP INDEX library_versions_search_index;
    """)

    execute("""
    DROP INDEX library_versions_name_trigram_index;
    """)

    execute("""
    DROP INDEX library_versions_name_lower_index;
    """)

    execute("""
    DROP INDEX guides_search_index;
    """)

    execute("""
    DROP INDEX guides_name_trigram_index;
    """)

    execute("""
    DROP INDEX guides_name_lower_index;
    """)

    execute("""
    DROP INDEX functions_search_index;
    """)

    execute("""
    DROP INDEX functions_name_trigram_index;
    """)

    execute("""
    DROP INDEX functions_name_lower_index;
    """)

    execute("""
    DROP INDEX extensions_search_index;
    """)

    execute("""
    DROP INDEX extensions_name_trigram_index;
    """)

    execute("""
    DROP INDEX extensions_name_lower_index;
    """)

    execute("""
    DROP INDEX dsls_search_index;
    """)

    execute("""
    DROP INDEX dsls_name_trigram_index;
    """)

    execute("""
    DROP INDEX dsls_name_lower_index;
    """)

    alter table(:options) do
      remove :links
    end
  end
end
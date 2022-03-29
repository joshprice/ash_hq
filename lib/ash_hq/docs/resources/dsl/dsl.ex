defmodule AshHq.Docs.Dsl do
  use AshHq.Resource,
    data_layer: AshPostgres.DataLayer,
    extensions: [AshHq.Docs.Extensions.Search, AshHq.Docs.Extensions.RenderMarkdown]

  render_markdown do
    render_attributes doc: :doc_html
  end

  search do
    load_for_search [
      :extension_order,
      :extension_type,
      :extension_name,
      :version_name,
      :library_name
    ]
  end

  postgres do
    table "dsls"
    repo AshHq.Repo
  end

  code_interface do
    define_for AshHq.Docs
    define :read
  end

  actions do
    read :read do
      primary? true
    end

    create :create do
      argument :options, {:array, :map}
      argument :library_version, :uuid

      argument :extension_id, :uuid do
        allow_nil? false
      end

      change {AshHq.Docs.Changes.AddArgToRelationship, arg: :extension_id, rel: :options}

      change {AshHq.Docs.Changes.AddArgToRelationship, arg: :library_version, rel: :options}
      change manage_relationship(:options, type: :direct_control)
      change manage_relationship(:library_version, type: :replace)
    end

    update :update do
      argument :options, {:array, :map}
      argument :library_version, :uuid

      change {AshHq.Docs.Changes.AddArgToRelationship,
              attr: :extension_id, arg: :extension_id, rel: :options}

      change {AshHq.Docs.Changes.AddArgToRelationship, arg: :library_version, rel: :options}

      change manage_relationship(:options, type: :direct_control)
      change manage_relationship(:library_version, type: :replace)
    end
  end

  attributes do
    uuid_primary_key :id

    attribute :name, :string do
      allow_nil? false
    end

    attribute :doc, :string do
      allow_nil? false
      constraints trim?: false, allow_empty?: true
      default ""
    end

    attribute :doc_html, :string do
      constraints trim?: false, allow_empty?: true
      writable? false
    end

    attribute :examples, {:array, :string}
    attribute :args, {:array, :string}
    attribute :path, {:array, :string}
    attribute :recursive_as, :string
    attribute :order, :integer, allow_nil?: false

    attribute :type, :atom do
      allow_nil? false
      constraints one_of: [:entity, :section]
    end
  end

  aggregates do
    first :extension_type, :extension, :type
    first :extension_order, :extension, :order
    first :extension_name, :extension, :name
    first :version_name, :library_version, :version
    first :library_name, [:library_version, :library], :name
  end

  relationships do
    belongs_to :library_version, AshHq.Docs.LibraryVersion do
      required? true
    end

    belongs_to :extension, AshHq.Docs.Extension do
      required? true
    end

    belongs_to :dsl, __MODULE__
    has_many :options, AshHq.Docs.Option
    has_many :dsls, __MODULE__
  end
end
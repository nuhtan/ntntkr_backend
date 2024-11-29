defmodule NtntkrBackend.Notebooks do
  use Ecto.Schema
  import Ecto.Changeset

  schema "notebooks" do
    field :name, :string
    field :type, Ecto.Enum, values: [:planner, :line, :dot]
    field :start_date, :date
    field :end_date, :date
    field :contents, :string
    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(notebooks, attrs) do
    notebooks
    |> cast(attrs, [:name, :start_date, :end_date, :type, :contents])
    |> validate_required([:name, :start_date, :end_date, :type, :contents])
  end
end

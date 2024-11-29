defmodule NtntkrBackendWeb.UsersController do
  use NtntkrBackendWeb, :controller

  def get(conn, %{"id" => id}) do
    user = NtntkrBackend.Users |> NtntkrBackend.Repo.get(id)
    json(conn, user)
  end

  def get_all(conn, _param) do
    users = NtntkrBackend.Users |> NtntkrBackend.Repo.all
    json(conn, users)
  end

  def create(conn, params) do
    user = %NtntkrBackend.Users{}
    changeset = NtntkrBackend.Users.changeset(user, params)
    NtntkrBackend.Repo.insert(changeset)
    text(conn, "ok")
  end

  def update(conn, %{"id" => id, "updates" => updates}) do
    user = NtntkrBackend.Users |> NtntkrBackend.Repo.get(id)
    changeset = NtntkrBackend.Users.changeset(user, Jason.decode!(updates))
    NtntkrBackend.Repo.update(changeset)
    text(conn, "ok")
  end

  def delete(conn, %{"id" => id}) do
    user = NtntkrBackend.Users |> NtntkrBackend.Repo.get(id)
    NtntkrBackend.Repo.delete(user)
    text(conn, "ok")
  end
end

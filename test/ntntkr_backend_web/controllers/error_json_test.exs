defmodule NtntkrBackendWeb.ErrorJSONTest do
  use NtntkrBackendWeb.ConnCase, async: true

  test "renders 404" do
    assert NtntkrBackendWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert NtntkrBackendWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end

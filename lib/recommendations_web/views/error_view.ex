defmodule RecommendationsWeb.ErrorView do
  use RecommendationsWeb, :view

  # If you want to customize a particular status code
  # for a certain format, you may uncomment below.
  # def render("500.html", _assigns) do
  #   "Internal Server Error"
  # end

  # By default, Phoenix returns the status message from
  # the template name. For example, "404.html" becomes
  # "Not Found".
  def template_not_found(template, _assigns) do
    Phoenix.Controller.status_message_from_template(template)
  end

  def render("error.json", %{changeset: changeset}) do
    errors =
      changeset
      |> translate_changeset_errors()
      |> error_list()

    %{errors: errors}
  end

  def render("exception_error.json", error) do
    %{errors: [%{detail: Exception.message(error)}]}
  end

  defp translate_changeset_errors(changeset) do
    Ecto.Changeset.traverse_errors(changeset, &translate_error/1)
  end

  def error_list(errors) when is_map(errors) do
    Enum.reduce(errors, [], fn
      {field, errors}, acc when is_list(errors) ->
        Enum.map(errors, fn error -> %{field: to_string(field), message: error} end) ++ acc

      {field, nested_errors}, acc when is_map(errors) ->
        error_list(
          Enum.into(nested_errors, %{}, fn {nested_field, errors} ->
            {"#{field}.#{nested_field}", errors}
          end)
        ) ++
          acc
    end)
  end
end

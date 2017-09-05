# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Searchlight.Repo.insert!(%Searchlight.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Searchlight.Repo.delete_all Searchlight.Coherence.User

Searchlight.Coherence.User.changeset(%Searchlight.Coherence.User{}, %{name: "Test User", email: "testuser@example.com", password: "secret", password_confirmation: "secret"})
|> Searchlight.Repo.insert!

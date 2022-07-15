# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ProjectTwo.Repo.insert!(%ProjectTwo.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


alias ProjectTwo.{Repo, ProjectTwo}

Repo.insert! %ProjectTwo{eng: "aliment", rus: "алименты"}
Repo.insert! %ProjectTwo{eng: "aliment", rus: "недуг"}

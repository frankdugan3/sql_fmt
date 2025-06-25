defmodule SqlFmt.HelpersTest do
  use ExUnit.Case
  import SqlFmt.Helpers
  import Ecto.Query

  test "sigil_SQL" do
    assert ~SQL"SELECT *" == "SELECT *"

    assert ~SQL"""
           SELECT *
           FROM users
           """ ==
             """
             SELECT *
             FROM users
             """
  end

  assert from("my_table", select: fragment(~SQL"? > ?", 2, 1))
  assert from("my_table", select: fragment(~SQL"now()"))
end

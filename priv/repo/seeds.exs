AshHq.Docs.Library.create!(%{name: "ash", display_name: "Ash", order: 0})

AshHq.Docs.Library.create!(%{
  name: "ash_postgres",
  display_name: "AshPostgres",
  order: 10
})

AshHq.Docs.Library.create!(%{
  name: "ash_phoenix",
  display_name: "AshPhoenix",
  order: 20
})

AshHq.Docs.Library.create!(%{
  name: "ash_archival",
  display_name: "AshArchival",
  order: 85
})

# Always at the bottom
AshHq.Docs.Library.create!(%{name: "spark", display_name: "Spark", order: 100})

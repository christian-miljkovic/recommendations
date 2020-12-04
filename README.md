# Recommendations

### To-do
- Create a schema module (check schemas in digits + context in phx docs)
- Create validator module for params that come in from a request
- Add create_recommendation logic by inserting into Repo
- Return response to twilio

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

# Setting up DB

1. `mix phx.gen.schema User users name:string email:string` (example with User)
2. `mix ecto.migrate`

## Learn more

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix

# NtntkrBackend

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Database Tables:

- Users
  - name
  - mix phx.gen.schema Users users name:string
- Notebooks
  - name
  - start_date
  - end_date
  - type
  - contents_overview
  - mix phx.gen.schema Notebooks notebooks name:string start_date:date end_date:date type:enum:planner:line:dot contents_overview:string user_id:references:users

# NestedLiveviewDynamicBug

This repo is a minimal repro of a bug with assign_new inside for child liveviews added dynamically.

To check it, follow the steps:

* Install dependencies with `mix deps.get`
* Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

You should see a component saying "Rendered statically, the title is:: passed through assigns"

After clicking the Submit button, you should see another saying "Added dynamically, the title is:not through assign_new "

import IO
import IEx
alias IO.ANSI

Application.put_env(:elixir, :ansi_enabled, true)


title = "❄❄ Welcome to Rummage Ecto Example ❄❄❄"

puts(ANSI.color_background(2, 0, 2) <> ANSI.color(3, 3, 0) <> title <> ANSI.reset())


configure(
 colors: [
   eval_result: [:green, :bright] ,
   eval_error: [[:red, :bright, "Some ERROR"]],
   eval_info: [:yellow, :bright ],
 ],
 default_prompt: [
   "\e[G",    # ANSI CHA, move cursor to column 1
    :white,
    "⚡",
    :red,
    "⚡" ,       # plain string
    :green,
    "%prefix", :white, "|",
     :blue,
     "%counter",
     :white,
     "|",
    :red,
    "▶" ,         # plain string
    :reset
  ] |> ANSI.format() |> chardata_to_string()
)

alias RummageEctoExample.{Repo, Category, Product}
Repo.start_link()


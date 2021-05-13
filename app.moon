lapis = require "lapis"
util = require "lapis.util"

favorite_foods = {
  "pizza": "Wow pizza is the best! Definitely my favorite"
  "egg": "A classic breakfast, never leave home without"
  "ice cream": "Can't have a food list without dessert"
}

class App extends lapis.Application
  [index: "/"]: =>
    -- Render HTML inline for simplicity
    @html ->
      h1 "My homepage"
      a href: @url_for("list_foods"), "Check out my favorite foods"

  [list_foods: "/foods"]: =>
    @html ->
      ul ->
        for food in pairs favorite_foods
          li ->
            a href: @url_for("food", name: food), food

  [food: "/food/:name"]: =>
    -- TODO(zmd): documentation PR to Lapis for the "ice cream" case
    name_decoded = util.unescape(@params.name)
    food_description = favorite_foods[name_decoded]
    unless food_description
      return "Not found", status: 404

    @html ->
      h1 name_decoded
      h2 "My thoughts on this food"
      p food_description

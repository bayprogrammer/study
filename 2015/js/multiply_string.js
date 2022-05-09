function multiply_string(str, factor) {
  // TODO: is there a built-in function that can accomplish this?
  var product = ""
  for (var n = 0; n < factor; n++)
    product += str;
  return product;
}

function reverse_string(str) {
  // TODO: surely there is already an equivalent function built in?
  //       ...also, I haven't studied JS string processing or for each
  //       loops yet, so don't laugh at this pitiful code unless you
  //       absolutely must!
  var new_str = "";
  for (var i in str)
    new_str = str[i] + new_str;
  return new_str;
}

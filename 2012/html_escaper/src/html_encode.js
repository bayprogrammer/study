function convert_text(source, destination)
{
    // First get the source value
    s_value = source.value;

    // Then use regex to replace all "<" with "&lt;"
    // http://www.regular-expressions.info/javascript.html
    s_value = s_value.replace(/</g, '&lt;');

    // Then update the destination
    destination.value = s_value;
}

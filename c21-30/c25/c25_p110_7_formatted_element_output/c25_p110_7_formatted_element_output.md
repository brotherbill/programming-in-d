# c25_p110_7_formatted_element_output

### To print **arrays** or **ranges**, each format string is wrappend (% and %)

The format pattern string has several parts, in this sequence:
1. `%(`      Start of formatting array values, wrapping strings in double quotes and characters in single quotes
   `%-(`    Head content.  Start of formatting array values, don't wrap strings in double quotes, nor wrap characters in single quotes.
2. `{`      Literal text to write before each item
3. `%s`      format string for each item
4.     Tail content.
   `\},`                                 Literal text to write after each item, except for the last item
   `%|\},`                             Same as above
   `\}, %|`                           Literal text to write after each item, including the last item
   `\}, %|NotAfterLast`  Literal text to write after each item, including the last item up to the %|.  NotAfterLast isn't included after last item.
5. `%)`     End of formatting array values
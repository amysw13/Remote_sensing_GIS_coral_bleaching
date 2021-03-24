```{r xaringan-themer, include=FALSE}
xaringanthemer::style_duo_accent(
  primary_color = "#006699",        # blue
  secondary_color = "#03A696",      # sea green
  header_font_google = xaringanthemer::google_font("Abel"),
  text_font_google = xaringanthemer::google_font("Kiwi Maru", "400"),
  code_font_google   = xaringanthemer::google_font("Oxanium", "500"),
  header_h1_font_size = "3.75rem",
  header_h2_font_size = "2.25rem",
  header_h3_font_size = "1.75rem",
  text_font_size = "0.9rem"
)
```

#customise code chunck background; colour code keywords, colour code string 

.remark-code-line{
  background: #f2f2f2;
}
.hljs-keyword{
  color: #cc0052;
}
.hljs-string{
  color: #e68a00;
}
.hljs-comment {
  font-style: italic;
  color: #666666;
}
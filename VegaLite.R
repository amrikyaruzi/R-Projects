
vegalite() %>%
  cell_size(height = 500, width = 400) %>% 
  add_data(dat) %>%
  encode_x("a", "ordinal") %>%
  encode_y("b", "quantitative") %>%
  mark_bar()



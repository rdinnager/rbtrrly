## This code makes this poster
make_poster <- function() {
library(ggplot2);library(imager);library(dplyr)
library(tidyr); library(colorspace); library(
sysfonts); library(showtext); if( !file.exists(
"this_poster_is_made.png" ) )  { download.file(
  "https://www.r-project.org/logo/Rlogo.png",
  "Rlogo.png", mode = "wb"); font_add_google(
"Finger Paint");R_logo<-load.image("Rlogo.png")
;poster_text <-capture.output(print(make_poster
  )) ;  poster_text <-  poster_text[ -length(
 poster_text)];  poster_text[ 1 ] <- paste0(
"make_poster <- ",poster_text[1]);poster_text<-
c("## This code makes this poster",poster_text,
 "make_poster()") ;  image_wid <- max( nchar(
 poster_text)); image_ht <- length(poster_text)
R_logo  <-  resize(R_logo, image_wid, image_ht,
interpolation_type = 3)  %>%  as.raster()  %>%
as.matrix() %>% as_tibble() %>% mutate(y_val =
 row_number( ) )  %>%  gather( x_val, colour,
-y_val)  %>%  transform( x_val = gsub("V",  "",
x_val) %>% as.numeric); poster_text <-strsplit(
poster_text, ""); letter_df <-lapply(seq_along(
  poster_text), function(x)  tibble( letter =
poster_text[[x]], x_val=seq_along(poster_text[[
x]]), y_val=x)) %>% bind_rows() %>% left_join(
R_logo); showtext_auto(); p <-ggplot(letter_df,
 aes(x_val,y_val)) + geom_raster( aes( fill =
lighten(colour,.3)))+geom_text(aes(label=letter
, colour = darken(colour,.2)), size=6, family =
"Finger Paint",fontface ="bold")+coord_equal()+
scale_color_identity() + scale_fill_identity()+
scale_y_reverse() + theme_void(); size_fact <-
0.1; ggsave("this_poster_is_made.png",p,height=
image_ht*size_fact,width=image_wid*size_fact)}}
make_poster()













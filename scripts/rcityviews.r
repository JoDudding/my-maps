#-------------------------------------------------------------------------------
#' rcityviews.r
    cli::cli_h1('rcityviews.r')
#-------------------------------------------------------------------------------
#' jo dudding
#' May 2025
#' trying the rcityviews package
#' https://github.com/koenderks/rcityviews
#' https://koenderks.github.io/rcityviews/
#-------------------------------------------------------------------------------

source('scripts/_setup.r')  
  
#--- find place ---

list_cities(match = 'Auckland')

list_cities(match = 'Pauanui')

list_cities(match = 'Ngatea')

#--- create custom for places to better center ---

pauanui <- new_city(name = 'Pauanui',
  country = 'New Zealand',
  lat = -37.019,
  long = 175.86,
  method = "osm")

ngatea <- new_city(name = 'Ngatea',
  country = 'New Zealand',
  lat = -37.276, 
  long = 175.494,
  method = "osm")

#--- function to save ---

gg_save <- function(save_name, plot = last_plot(), dpi = 100) {
  ggplot2::ggsave(
    filename = glue("outputs/{save_name}.png"), 
    plot = plot, 
    height = 500, 
    width = 500, 
    units = "mm", 
    dpi = dpi
  )
}

#--- personalise theme ---

jo_theme <- list(
  colors = list(
    background = "#232323",
    water = "#232323",
    landuse = "#232323",
    contours = "#232323",
    streets = "#d7b174",
    rails = c("#d7b174", "#232323"),
    buildings = "#232323",
    text = "#ffffff",
    waterlines = "#232323"
  ),
  font = list(
    family = "serif",
    face = "bold",
    scale = 1,
    append = "\u2014"
  ),
  size = list(
    borders = list(
      contours = 0.15,
      water = 0.4,
      canal = 0.5,
      river = 0.6
    ),
    streets = list(
      path = 0.2,
      residential = 0.3,
      structure = 0.35,
      tertiary = 0.4,
      secondary = 0.5,
      primary = 0.6,
      motorway = 0.8,
      rails = 0.65,
      runway = 3
    )
  )
)

#--- pauanui maps ---

p_pauanui  <- cityview(name = pauanui, zoom = 1.2, theme = 'vintage')
p_pauanui2 <- cityview(name = pauanui, zoom = 1.2, theme = "rouge")
p_pauanui3 <- cityview(name = pauanui, zoom = 1.2, theme = "bright")
p_pauanui4 <- cityview(name = pauanui, zoom = 1.2, theme = "delftware")
p_pauanui5 <- cityview(name = pauanui, zoom = 1.2, theme = "modern")

gg_save('Pauanui-base', p_pauanui)
gg_save('Pauanui-rouge', p_pauanui2)
gg_save('Pauanui-bright', p_pauanui3)
gg_save('Pauanui-delftware', p_pauanui4)
gg_save('Pauanui-modern', p_pauanui5)


#--- ngatea maps ---

p_ngatea  <- cityview(name = ngatea, zoom = 2, theme = 'delftware', border = 'circle')

gg_save('Ngatea-delftware', p_ngatea)

#--- auckland maps ---

p_auck <- cityview(name = 'Auckland', zoom = 1)

p_auck2 <- cityview(name = 'Auckland', zoom = 2)

p_auck3 <- cityview(name = 'Auckland', zoom = 0.5)

gg_save('Auckland-base', p_auck)
gg_save('Auckland-base2', p_auck2)
gg_save('Auckland-base3', p_auck3)





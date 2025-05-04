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

list_cities(match = 'Hamilton')

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

ham_east <- new_city(name = 'Hamilton East',
  country = '',
  lat = -37.792, 
  long = 175.298, 
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
    background = "#6800A8FF",
    water = "#6800A8FF",
    landuse = "#6800A8FF",
    contours = "#6800A8FF",
    streets = "#F9973FFF",
    rails = c("#F9973FFF", "#6800A8FF"),
    buildings = "#6800A8FF",
    text = "#ffffff",
    waterlines = "#6800A8FF"
  ),
  font = list(
    family = "serif",
    face = "bold",
    scale = 0,
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

morgan_swatch <- c('#FAAB72', '#ECB3D6', '#a0babc', '#F7DA94', '#c8e9eb', 
  '#F6A7A0')

morgan_theme <- list(
  colors = list(
    background = "#F6F2E9",
    water = "#c8e9eb",
    landuse = "#F6F2E9",
    contours = "#F6F2E9",
    streets = "#a0babc",
    rails = c("#FAAB72", "#F6F2E9"),
    buildings = "#F7DA94",
    text = "#F6A7A0",
    waterlines = "#F6F2E9"
  ),
  font = list(
    family = "Montserrat",
    face = "bold",
    scale = 0.8,
    append = ""
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
      residential = 0.4,
      structure = 0.45,
      tertiary = 0.5,
      secondary = 0.6,
      primary = 0.7,
      motorway = 0.9,
      rails = 0.65,
      runway = 3
    )
  )
)

delft_swatch <- c("#fafafa", "#7ebaee", "#8da8d7", "#3259a6", "#0c133f", "#1F305E")

delft_theme <- list(
  colors = list(
    background = "#fafafa",
    water = "#3259a6",
    landuse = "#fafafa",
    contours = "#fafafa",
    streets = "#1F305E",
    rails = c("#fafafa", "#fafafa"),
    buildings = "#fafafa",
    text = "#1F305E",
    waterlines = "#fafafa"
  ),
  font = list(
    family = "Montserrat",
    face = "bold",
    scale = 0.8,
    append = ""
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
      residential = 0.4,
      structure = 0.45,
      tertiary = 0.5,
      secondary = 0.6,
      primary = 0.7,
      motorway = 0.9,
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
p_pauanui6 <- cityview(name = pauanui, zoom = 1.2, theme = jo_theme)

gg_save('Pauanui-base', p_pauanui)
gg_save('Pauanui-rouge', p_pauanui2)
gg_save('Pauanui-bright', p_pauanui3)
gg_save('Pauanui-delftware', p_pauanui4)
gg_save('Pauanui-modern', p_pauanui5)
gg_save('Pauanui-custom', p_pauanui6)


#--- ngatea maps ---

p_ngatea  <- cityview(name = ngatea, zoom = 2, theme = 'delftware', border = 'circle')
p_ngatea2  <- cityview(name = ngatea, zoom = 2, theme = delft_theme)

gg_save('Ngatea-delftware', p_ngatea)
gg_save('Ngatea-custom', p_ngatea2)

#--- hamilton east maps ---

p_hameast  <- cityview(name = ham_east, zoom = 1.4, theme = morgan_theme, 
  border = 'circle')

gg_save('Hamilton-East-custom', p_hameast)

#--- auckland maps ---

p_auck <- cityview(name = 'Auckland', zoom = 1)

p_auck2 <- cityview(name = 'Auckland', zoom = 2)

p_auck3 <- cityview(name = 'Auckland', zoom = 0.5)

gg_save('Auckland-base', p_auck)
gg_save('Auckland-base2', p_auck2)
gg_save('Auckland-base3', p_auck3)





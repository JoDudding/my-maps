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

pauanui <- new_city(name = 'Pauanui',
  country = 'New Zealand',
  lat = -37.019,
  long = 175.86,
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

#--- create base map ---

p_auck <- cityview(name = 'Auckland', zoom = 1)

p_auck2 <- cityview(name = 'Auckland', zoom = 2)

p_auck3 <- cityview(name = 'Auckland', zoom = 0.5)

p_pauanui <- cityview(name = 'Pauanui Beach', zoom = 1)

p_pauanui2 <- cityview(name = 'Pauanui Beach', zoom = 1.5, theme = "rouge")

p_pauanui3 <- cityview(name = pauanui, zoom = 1.5, theme = "bright")

p_pauanui4 <- cityview(name = pauanui, zoom = 1.5, theme = "delftware")

p_pauanui5 <- cityview(name = pauanui, zoom = 1.5, theme = "modern")


#--- save ---

ggplot2::ggsave(
  filename = "outputs/Auckland-base.png", 
  plot = p_auck, 
  height = 500, 
  width = 500, 
  units = "mm", 
  dpi = 100
)

ggplot2::ggsave(
  filename = "outputs/Auckland-base2.png", 
  plot = p_auck2, 
  height = 500, 
  width = 500, 
  units = "mm", 
  dpi = 100
)

ggplot2::ggsave(
  filename = "outputs/Auckland-base3.png", 
  plot = p_auck3, 
  height = 500, 
  width = 500, 
  units = "mm", 
  dpi = 100
)



gg_save('Pauanui-base', p_pauanui)
gg_save('Pauanui-rouge.png', p_pauanui2)
gg_save('Pauanui-bright', p_pauanui3)
gg_save('Pauanui-delftware', p_pauanui4)
gg_save('Pauanui-modern', p_pauanui5)


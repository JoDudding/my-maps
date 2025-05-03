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

#--- create custom for Pauanui to better center ---

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


#--- auckland maps ---

p_auck <- cityview(name = 'Auckland', zoom = 1)

p_auck2 <- cityview(name = 'Auckland', zoom = 2)

p_auck3 <- cityview(name = 'Auckland', zoom = 0.5)

gg_save('Auckland-base', p_auck)
gg_save('Auckland-base2', p_auck2)
gg_save('Auckland-base3', p_auck3)





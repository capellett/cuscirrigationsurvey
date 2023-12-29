library(tidyverse)

irr <- readxl::read_excel("compilation.xlsx") 

sources <- readxl::read_excel("compilation.xlsx", sheet=2) %>%
  tidyr::gather("County", "Source", Abbeville:York)

# table(irr$Year)
# table(irr$Category)
# table(irr$Subcategory)

irr2 <- tidyr::gather(irr, "County", "Value", Abbeville:York) %>%
  dplyr::left_join(sources, by=c("County", "Year"))

rm(irr, sources)

# unique(irr2$Year)
## 1997 1998 1999 2000
# unique(irr2$Category)
## "Sprinkler", "Gravity/Flood", "Low Flow / Drip", "Total Irrigated Acreage", 
## "Irrigation Power Unit Types", "Irrigation Wells", "Pumps", "Irrigation by Crop"         


## then statewide irrigation by crop divided in to major and minor crops (?)
cu_crop_irrigation <- dplyr::filter(irr2, Category=='Irrigation by Crop')
## graph this along with the other datasets that can do County*Crop

irr3 <- irr2 %>% dplyr::anti_join(cu_crop_irrigation)

## a statewide graph with each distribution system category and total acreage
cu_irrigation_category <- irr2 %>%
  dplyr::filter(Subcategory %in% c(
    'Total Sprinkler Acreage', 'Total Gravity Acreage', 'Total Drip Acreage') | 
      is.na(Subcategory)) %>%
  dplyr::mutate(Acres=dplyr::if_else(is.na(Value), 0, Value)) %>%
  dplyr::select(-Subcategory, -Value)

cu_irrigation_category %>%
  dplyr::group_by(Year, Category) %>%
  dplyr::summarise(`Acres (thousands)`= sum(Acres)/1000) %>%
  ggplot2::ggplot(
    ggplot2::aes(x=Year, y=`Acres (thousands)`, color=Category)) +
  ggplot2::geom_line() +
  ggplot2::theme_bw() +
  ggplot2::ggtitle('CU Irrigated Acreage by Distribution System') +
  ggplot2::theme(legend.position='bottom', legend.title=ggplot2::element_blank())
# ggplot2::ggsave('CU Irrigated Acreage by Distribution System')

## This looks good enough for the first draft.
## use linetype instead of color to distinguish the lines.
## gravity = solid, low flow = dashed, sprinkler = dotted, total = solid and size 1.


## and a table of major counties, including power unit types, wells, and pumps.
## represent the Percent data with annual bar chart
cu_major_irrigation_attributes <- irr2 %>%
  dplyr::filter(Category %in% c("Irrigation Power Unit Types", "Irrigation Wells", "Pumps"))


## then each distribution system category gets a statewide graph of subcategories.
cu_irrigation_subcategory <- irr2 %>% dplyr::filter(
  Category %in% c("Sprinkler", "Gravity/Flood", "Low Flow / Drip") &
    !(stringr::str_sub(Subcategory, 0,1) == '%')) %>%
  dplyr::mutate(Value = dplyr::if_else(is.na(Value), 0, Value)) %>%
  dplyr::group_by(Year, Category, Subcategory) %>%
  dplyr::summarise(Acres = sum(Value, na.rm=T)) %>%
  dplyr::ungroup()

cu_irrigation_subcategory %>%
  dplyr::group_by(Category) %>%
  dplyr::group_walk(function(.x, .y) {
    p <- ggplot2::ggplot(.x, ggplot2::aes(x=Year, y=Acres, color=Subcategory)) +
      ggplot2::geom_line() +
      ggplot2::theme_bw() +
      ggplot2::ggtitle(paste0('CU Acreage Irrigated by ', .y$Category)) +
      ggplot2::theme(legend.title=ggplot2::element_blank())
    print(p)
  })

cu_irrigation_subcategory %>%
  tidyr::pivot_wider(names_from=Year, values_from='Acres') %>%
  scutils::reporTable()


## and a table of major counties for each category, including the %columns for that category.

#' County irrigated acreage by category of irrigation
#' 
#' A dataset with the amount of acreage irrigated each year in each county 
#'  by each category of irrigation distribution system.
#'
#' @format A data frame with 4,232 rows and 6 variables:
#' \describe{
#'    \item{County}{The name of the County, in title case ("McCormick")}
#'    \item{Category}{Sprinkler, Low Flow / Drip, Gravity/Flood, or Total Irrigated Acreage}
#'    \item{Subcategory}{Sprinkler, Drip, and Flood irrigation are subdivided into more specific categories.}
#'    \item{Year}{1997-2000}
#'    \item{Acres}{Number of acres irrigated}
#'    \item{Source}{name of the extension agent who collected the data}
#'  }
#'
#' @details Data collected by county extension agents in South Carolina. 
#' @source W Bryan Smith, Area Extension Agent, Clemson University
#' @references Irrigation Journal (2001)  
#' @seealso [crops], [irr_attributes]  
'categories'

#' County irrigated acreage by crop
#' 
#' A dataset with the amount of acreage for each irrigated crop each year in each county.
#'
#' @format A data frame with 6,348 rows and 5 variables:
#' \describe{
#'    \item{County}{The name of the County, in title case ("McCormick")}
#'    \item{Crop}{Name of the irrigated crop, one of: `r sort(unique(crops$Crop))`}
#'    \item{Year}{1997-2000}
#'    \item{Acres}{Number of acres irrigated}
#'    \item{Source}{name of the extension agent who collected the data}
#'  }
#'  
#' @details Data collected by county extension agents in South Carolina. 
#' @source W Bryan Smith, Area Extension Agent, Clemson University
#' @references Irrigation Journal (2001)  
#' @seealso [categories], [irr_attributes]  
'crops'

#' County irrigation attributes
#' 
#' A dataset with the amount of acreage irrigated each year in each county 
#'  by each category of irrigation distribution system.
#'
#' @format A data frame with 2,392 rows and 6 variables:
#' \describe{
#'    \item{County}{The name of the County, in title case ("McCormick")}
#'    \item{Category}{Irrigation Power Unit Types, Irrigation Wells, or Pumps}
#'    \item{Subcategory}{Different responses for each attribute}
#'    \item{Year}{1997-2000}
#'    \item{Value}{The total or percent response from each county}
#'    \item{Source}{name of the extension agent who collected the data}
#'  }
#'  
#' @details Data collected by county extension agents in South Carolina. 
#' @source W Bryan Smith, Area Extension Agent, Clemson University  
#' @references Irrigation Journal (2001)  
#' @seealso [categories], [crops]  
'irr_attributes'
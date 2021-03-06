% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tm_layers.R
\name{tm_fill}
\alias{tm_fill}
\alias{tm_borders}
\alias{tm_polygons}
\title{Draw polygons}
\usage{
tm_fill(col = NA, alpha = NA, palette = NULL,
  convert2density = FALSE, area = NULL, n = 5,
  style = ifelse(is.null(breaks), "pretty", "fixed"), breaks = NULL,
  interval.closure = "left", labels = NULL, midpoint = NULL,
  stretch.palette = TRUE, contrast = NA, colorNA = NA,
  textNA = "Missing", showNA = NA, colorNULL = NA, thres.poly = 0,
  title = NA, legend.show = TRUE, legend.format = list(),
  legend.is.portrait = TRUE, legend.reverse = FALSE,
  legend.hist = FALSE, legend.hist.title = NA, legend.z = NA,
  legend.hist.z = NA, id = NA, popup.vars = NA,
  popup.format = list(), zindex = NA, group = NA,
  auto.palette.mapping = NULL, max.categories = NULL, ...)

tm_borders(col = NA, lwd = 1, lty = "solid", alpha = NA,
  group = NA)

tm_polygons(col = NA, alpha = NA, border.col = NA,
  border.alpha = NA, group = NA, ...)
}
\arguments{
\item{col}{For \code{tm_fill}, it is one of
\itemize{
\item a single color value
\item the name of a data variable that is contained in \code{shp}. Either the data variable contains color values, or values (numeric or categorical) that will be depicted by a color palette (see \code{palette}. In the latter case, a choropleth is drawn. 
\item \code{"MAP_COLORS"}. In this case polygons will be colored such that adjacent polygons do not get the same color. See the underlying function \code{\link[tmaptools:map_coloring]{map_coloring}} for details.}
For \code{tm_borders}, it is a single color value that specifies the border line color. If multiple values are specified, small multiples are drawn (see details).}

\item{alpha}{transparency number between 0 (totally transparent) and 1 (not transparent). By default, the alpha value of the \code{col} is used (normally 1).}

\item{palette}{a palette name or a vector of colors. See \code{tmaptools::palette_explorer()} for the named palettes. Use a \code{"-"} as prefix to reverse the palette. The default palette is taken from \code{\link{tm_layout}}'s argument \code{aes.palette}, which typically depends on the style. The type of palette from \code{aes.palette} is automatically determined, but can be overwritten: use \code{"seq"} for sequential, \code{"div"} for diverging, and \code{"cat"} for categorical.}

\item{convert2density}{boolean that determines whether \code{col} is converted to a density variable. Should be \code{TRUE} when \code{col} consists of absolute numbers. The area size is either approximated from the shape object, or given by the argument \code{area}.}

\item{area}{Name of the data variable that contains the area sizes in squared kilometer.}

\item{n}{preferred number of classes (in case \code{col} is a numeric variable).}

\item{style}{method to process the color scale when \code{col} is a numeric variable. Discrete options are \code{"cat"}, \code{"fixed"}, \code{"sd"}, \code{"equal"}, \code{"pretty"}, \code{"quantile"}, \code{"kmeans"}, \code{"hclust"}, \code{"bclust"}, \code{"fisher"}, \code{"jenks"}, and \code{"log10_pretty"}. A numeric variable is processed as a categorical variable when using \code{"cat"}, i.e. each unique value will correspond to a distinct category. For the other discrete options (except \code{"log10_pretty"}), see the details in \code{\link[classInt:classIntervals]{classIntervals}}. Continuous options are \code{"cont"}, \code{"order"}, and \code{"log10"}. The first maps the values of \code{col} to a smooth gradient, the second maps the order of values of \code{col} to a smooth gradient, and the third uses a logarithmic transformation.}

\item{breaks}{in case \code{style=="fixed"}, breaks should be specified. The \code{breaks} argument can also be used when \code{style="cont"}. In that case, the breaks are mapped evenly to the sequential or diverging color palette.}

\item{interval.closure}{value that determines whether where the intervals are closed: \code{"left"} or \code{"right"}. Only applicable if \code{col} is a numeric variable.}

\item{labels}{labels of the classes.}

\item{midpoint}{The value mapped to the middle color of a diverging palette. By default it is set to 0 if negative and positive values are present. In that case, the two sides of the color palette are assigned to negative respectively positive values. If all values are positive or all values are negative, then the midpoint is set to \code{NA}, which means that the value that corresponds to the middle color class (see \code{style}) is mapped to the middle color. Only applies when \code{col} is a numeric variable. If it is specified for sequential color palettes (e.g. \code{"Blues"}), then this color palette will be treated as a diverging color palette.}

\item{stretch.palette}{Logical that determines whether the categorical color palette should be stretched if there are more categories than colors. If \code{TRUE} (default), interpolated colors are used (like a rainbow). If \code{FALSE}, the palette is repeated.}

\item{contrast}{vector of two numbers that determine the range that is used for sequential and diverging palettes (applicable when \code{auto.palette.mapping=TRUE}). Both numbers should be between 0 and 1. The first number determines where the palette begins, and the second number where it ends. For sequential palettes, 0 means the brightest color, and 1 the darkest color. For diverging palettes, 0 means the middle color, and 1 both extremes. If only one number is provided, this number is interpreted as the endpoint (with 0 taken as the start).}

\item{colorNA}{color used for missing values. Use \code{NULL} for transparency.}

\item{textNA}{text used for missing values.}

\item{showNA}{logical that determines whether missing values are named in the legend. By default (\code{NA}), this depends on the presence of missing values.}

\item{colorNULL}{colour for polygons that are shown on the map that are out of scope}

\item{thres.poly}{number that specifies the threshold at which polygons are taken into account. The number itself corresponds to the proportion of the area sizes of the polygons to the total polygon size. By default, all polygons are drawn. To ignore polygons that are not visible in a normal plot, a value like \code{1e-05} is recommended.}

\item{title}{title of the legend element}

\item{legend.show}{logical that determines whether the legend is shown}

\item{legend.format}{list of formatting options for the legend numbers. Only applicable if \code{labels} is undefined. Parameters are:
\describe{
\item{fun}{Function to specify the labels. It should take a numeric vector, and should return a character vector of the same size. By default it is not specified. If specified, the list items \code{scientific}, \code{format}, and \code{digits} (see below) are not used.}
\item{scientific}{Should the labels be formatted scientifically? If so, square brackets are used, and the \code{format} of the numbers is \code{"g"}. Otherwise, \code{format="f"}, and \code{text.separator}, \code{text.less.than}, and \code{text.or.more} are used. Also, the numbers are automatically  rounded to millions or billions if applicable.}
\item{format}{By default, \code{"f"}, i.e. the standard notation \code{xxx.xxx}, is used. If \code{scientific=TRUE} then \code{"g"}, which means that numbers are formatted scientifically, i.e. \code{n.dddE+nn} if needed to save space.}
\item{digits}{Number of digits after the decimal point if \code{format="f"}, and the number of significant digits otherwise.}
\item{big.num.abbr}{Vector that defines whether and which abbrevations are used for large numbers. It is a named numeric vector, where the name indicated the abbreviation, and the number the magnitude (in terms on numbers of zero). Numbers are only abbrevation when they are large enough. Set it to \code{NA} to disable abbrevations.  The default is \code{c("mln" = 6, "bln" = 9)}. For layers where \code{style} is set to \code{log10} or \code{log10_pretty}, the default is \code{NA}.}
\item{prefix}{Prefix of each number}
\item{suffix}{Suffix of each number}
\item{text.separator}{Character string to use to separate numbers in the legend (default: "to").}
\item{text.less.than}{Character value(s) to use to translate "Less than". When a character vector of length 2 is specified, one for each word, these words are aligned when \code{text.to.columns = TRUE}}
\item{text.or.more}{Character value(s) to use to translate "or more". When a character vector of length 2 is specified, one for each word, these words are aligned when \code{text.to.columns = TRUE}}
\item{text.align}{Value that determines how the numbers are aligned, \code{"left"}, \code{"center"} or \code{"right"}}. By default \code{"left"} for legends in portrait format (\code{legend.is.protrait = TRUE}), and \code{"center"} otherwise.
\item{text.to.columns}{Logical that determines whether the text is aligned to three columns (from, text.separator, to). By default \code{FALSE}.}
\item{...}{Other arguments passed on to \code{\link[base:formatC]{formatC}}}
}}

\item{legend.is.portrait}{logical that determines whether the legend is in portrait mode (\code{TRUE}) or landscape (\code{FALSE})}

\item{legend.reverse}{logical that determines whether the items are shown in reverse order, i.e. from bottom to top when \code{legend.is.portrait = TRUE} and from right to left when \code{legend.is.portrait = FALSE}}

\item{legend.hist}{logical that determines whether a histogram is shown}

\item{legend.hist.title}{title for the histogram. By default, one title is used for both the histogram and the normal legend.}

\item{legend.z}{index value that determines the position of the legend element with respect to other legend elements. The legend elements are stacked according to their z values. The legend element with the lowest z value is placed on top.}

\item{legend.hist.z}{index value that determines the position of the histogram legend element}

\item{id}{name of the data variable that specifies the indices of the polygons. Only used for \code{"view"} mode (see \code{\link{tmap_mode}}).}

\item{popup.vars}{names of data variables that are shown in the popups in \code{"view"} mode. If \code{convert2density=TRUE}, the derived density variable name is suffixed with \code{_density}. If \code{NA} (default), only aesthetic variables (i.e. specified by \code{col} and \code{lwd}) are shown). If they are not specified, all variables are shown. Set popup.vars to \code{FALSE} to disable popups. When a vector of variable names is provided, the names (if specified) are printed in the popups.}

\item{popup.format}{list of formatting options for the popup values. See the argument \code{legend.format} for options. Only applicable for numeric data variables. If one list of formatting options is provided, it is applied to all numeric variables of \code{popup.vars}. Also, a (named) list of lists can be provided. In that case, each list of formatting options is applied to the named variable.}

\item{zindex}{zindex of the pane in view mode. By default, it is set to the layer number plus 400. By default, the tmap layers will therefore be placed in the custom panes \code{"tmap401"}, \code{"tmap402"}, etc., except for the base tile layers, which are placed in the standard \code{"tile"}. This parameter determines both the name of the pane and the z-index, which determines the pane order from bottom to top. For instance, if \code{zindex} is set to 500, the pane will be named \code{"tmap500"}.}

\item{group}{name of the group to which this layer belongs in view mode. Each group can be selected or deselected in the layer control item. Set \code{group = NULL} to hide the layer in the layer control item. By default, it will be set to the name of the shape (specified in \code{\link{tm_shape}}).}

\item{auto.palette.mapping}{deprecated. It has been replaced by \code{midpoint} for numeric variables and \code{stretch.palette} for categorical variables.}

\item{max.categories}{deprecated. It has moved to \code{\link{tmap_options}}.}

\item{...}{for \code{tm_polygons}, these arguments passed to either \code{tm_fill} or \code{tm_borders}. For \code{tm_fill}, these arguments are passed on to \code{\link[tmaptools:map_coloring]{map_coloring}}.}

\item{lwd}{border line width (see \code{\link[graphics:par]{par}})}

\item{lty}{border line type (see \code{\link[graphics:par]{par}})}

\item{border.col}{border line color}

\item{border.alpha}{transparency number between 0 (totally transparent) and 1 (not transparent). By default, the alpha value of the \code{col} is used (normally 1).}
}
\value{
\code{\link{tmap-element}}
}
\description{
Creates a \code{\link{tmap-element}} that draws the polygons. \code{tm_fill} fills the polygons. Either a fixed color is used, or a color palette is mapped to a data variable. \code{tm_borders} draws the borders of the polygons. \code{tm_polygons} fills the polygons and draws the polygon borders.
}
\details{
Small multiples can be drawn in two ways: either by specifying the \code{by} argument in \code{\link{tm_facets}}, or by defining multiple variables in the aesthetic arguments. The aesthetic argument of \code{tm_fill} (and \code{tm_polygons}) is \code{col}. In the latter case, the arguments, except for \code{thres.poly}, and the ones starting with \code{legend.}, can be specified for small multiples as follows. If the argument normally only takes a single value, such as \code{n}, then a vector of those values can be specified, one for each small multiple. If the argument normally can take a vector, such as \code{palette}, then a list of those vectors (or values) can be specified, one for each small multiple.
}
\examples{
data(World)

# Constant fill
tm_shape(World) + tm_fill("darkolivegreen3") + tm_format("World", title="A green World")

# Borders only
tm_shape(World) + tm_borders()

# Data variable containing colours values
World$isNLD <- ifelse(World$name=="Netherlands", "darkorange", "darkolivegreen3")
tm_shape(World) +
    tm_fill("isNLD") +
tm_layout("Find the Netherlands!")

tm_shape(World) +
	tm_polygons("economy", title="Economy", id="name") +
	tm_text("iso_a3", size="AREA", scale=1.5) +
	tm_format("World")

# Numeric data variable
tm_shape(World) +
	tm_polygons("HPI", palette="RdYlGn", style="cont", n=8,
		title="Happy Planet Index", id="name") +
	tm_text("iso_a3", size="AREA", scale=1.5) +
tm_style("grey") +
tm_format("World")

\dontrun{
data(NLD_prov, NLD_muni)	
# Map coloring algorithm
tm_shape(NLD_prov) +
    tm_fill("name", legend.show = FALSE) +
tm_shape(NLD_muni) +
    tm_polygons("MAP_COLORS", palette="Greys", alpha = .25) +
tm_shape(NLD_prov) +
    tm_borders(lwd=2) +
    tm_text("name", shadow=TRUE) +
tm_format("NLD", title="Dutch provinces and\\nmunicipalities", bg.color="white")

# Cartogram
if (require(cartogram)) {
	NLD_prov_pop <- cartogram(NLD_prov, "population")
	tm_shape(NLD_prov_pop) +
		tm_polygons("origin_non_west", title = "Non-western origin (\%)")
}
}

# TIP: check out these examples in view mode, enabled with tmap_mode("view")
}
\references{
Tennekes, M., 2018, {tmap}: Thematic Maps in {R}, Journal of Statistical Software, 84(6), 1-39, \href{https://doi.org/10.18637/jss.v084.i06}{DOI}
}
\seealso{
\href{../doc/tmap-getstarted.html}{\code{vignette("tmap-getstarted")}}
}
\concept{choropleth}

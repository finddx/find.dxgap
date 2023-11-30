#' Data dictionary
#'
#' It shows all supported data of the project. It should be kept up-to-date.
#'
#' @format ## `dxgap_master_list`
#' A data frame:
#' \describe{
#'   \item{data_source}{The name of data provider}
#'   \item{variable_name}{The variable name}
#'   \item{url_endpoint}{The endpoint if the data set can be fetched programmatically}
#'   \item{definition}{Description of the `variable_name`}
#'   \item{url}{Url of the source, if any}
#'   \item{notes}{Additional notes, if any}
#' }
"dxgap_master_list"

module Layout exposing (Layout(..), layoutToQuery, toLayout)

import Dict
import Url
import Url.Builder exposing (absolute)
import Url.Parser exposing (map)
import Url.Parser.Query


type Layout
    = Browser
    | Extension


toLayout : Url.Url -> Layout
toLayout url =
    Url.Parser.parse (map (Maybe.withDefault Browser) (Url.Parser.query query)) url
        |> Maybe.withDefault Browser


query : Url.Parser.Query.Parser (Maybe Layout)
query =
    Url.Parser.Query.enum "layout" (Dict.fromList [ ( "ext", Extension ) ])


layoutToQuery : Layout -> List Url.Builder.QueryParameter
layoutToQuery layout_ =
    case layout_ of
        Browser ->
            []

        Extension ->
            [ Url.Builder.string "layout" "ext" ]

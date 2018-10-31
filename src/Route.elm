module Route exposing (Route(..), fromRoute, toRoute)

import Layout exposing (Layout, layoutToQuery)
import Url
import Url.Builder exposing (absolute)
import Url.Parser exposing ((</>), int, map, oneOf, s, top)


type Route
    = About
    | WSC (Maybe Int)


toRoute : Url.Url -> Route
toRoute url =
    Maybe.withDefault (WSC Nothing) (Url.Parser.parse route url)


route : Url.Parser.Parser (Route -> a) a
route =
    oneOf
        [ map (WSC Nothing) top
        , map (WSC << Just) int
        , map About (s "about")
        ]


fromRoute : Layout -> Route -> String
fromRoute layout route_ =
    case route_ of
        About ->
            absolute [ "about" ] (layoutToQuery layout)

        WSC (Just num) ->
            absolute [ String.fromInt num ] (layoutToQuery layout)

        WSC Nothing ->
            absolute [] (layoutToQuery layout)

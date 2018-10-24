module Route exposing (Route(..), fromRoute, toRoute)

import Url
import Url.Builder exposing (absolute)
import Url.Parser exposing ((</>), int, map, oneOf, s, top)


type Route
    = About
    | WSC (Maybe Int)


route : Url.Parser.Parser (Route -> a) a
route =
    oneOf
        [ map (WSC Nothing) top
        , map (WSC << Just) int
        , map About (s "about")
        ]


toRoute : Url.Url -> Route
toRoute url =
    Maybe.withDefault (WSC Nothing) (Url.Parser.parse route url)


fromRoute : Route -> String
fromRoute route_ =
    case route_ of
        About ->
            absolute [ "about" ] []

        WSC (Just num) ->
            absolute [ String.fromInt num ] []

        WSC Nothing ->
            absolute [] []

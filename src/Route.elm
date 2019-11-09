module Route exposing (Route(..), fromRoute, toRoute, toTitle)

import Layout exposing (Layout, layoutToQuery)
import Url
import Url.Builder exposing (absolute)
import Url.Parser exposing ((</>), int, map, oneOf, s, top)


type Route
    = About
    | WSC (Maybe Int)
    | WLC (Maybe Int)


toRoute : Url.Url -> Route
toRoute url =
    Maybe.withDefault (WSC Nothing) (Url.Parser.parse route url)


route : Url.Parser.Parser (Route -> a) a
route =
    oneOf
        [ map (WSC Nothing) top
        , map (WSC Nothing) (s "wsc")
        , map (WSC << Just) (s "wsc" </> int)
        , map (WLC Nothing) (s "wlc")
        , map (WLC << Just) (s "wlc" </> int)
        , map About (s "about")
        ]


fromRoute : Layout -> Route -> String
fromRoute layout route_ =
    case route_ of
        About ->
            absolute [ "about" ] (layoutToQuery layout)

        WSC (Just num) ->
            absolute [ "wsc", String.fromInt num ] (layoutToQuery layout)

        WSC Nothing ->
            absolute [] (layoutToQuery layout)

        WLC (Just num) ->
            absolute [ "wlc", String.fromInt num ] (layoutToQuery layout)

        WLC Nothing ->
            absolute [ "wlc" ] (layoutToQuery layout)


toTitle : Route -> String
toTitle route_ =
    case route_ of
        WSC _ ->
            "Westminster Shorter Catechism"

        About ->
            "Westminster Shorter Catechism"

        WLC _ ->
            "Westminster Larger Catechism"

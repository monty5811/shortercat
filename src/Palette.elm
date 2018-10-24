module Palette exposing (blue, darkBlue, lg, lightBlue, md, palette, red, sm, white, xl, xs, xxl, xxs, yellow)

import Element exposing (..)
import Element.Background as Background



-- Sizes


xxs =
    2


xs =
    4


sm =
    8


md =
    12


lg =
    18


xl =
    30


xxl =
    48



-- Colours


white : Color
white =
    rgb 1 1 1


red : Color
red =
    rgb255 253 79 19


lightBlue : Color
lightBlue =
    rgb255 13 173 184


blue : Color
blue =
    rgb255 19 143 157


darkBlue : Color
darkBlue =
    rgb255 50 71 79


yellow : Color
yellow =
    rgb255 245 233 20



-- Examples:


palette : Element msg
palette =
    row
        [ alignBottom
        , width fill
        , padding 12
        , spaceEvenly
        ]
        [ box "red" red
        , box "yellow" yellow
        , box "lightBlue" lightBlue
        , box "blue" blue
        , box "darkBlue" darkBlue
        ]


box : String -> Color -> Element msg
box name colour =
    column
        [ padding 24
        , Background.color colour
        ]
        [ text name ]

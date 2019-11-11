module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Data exposing (..)
import Dict exposing (Dict)
import Html exposing (Html)
import Html.Attributes as A
import Html.Events as E
import Http
import Layout exposing (Layout(..), toLayout)
import RemoteData as RD exposing (WebData)
import Route exposing (Route(..), fromRoute, toRoute)
import TW
import Url


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = ClickedLink
        , onUrlChange = UrlChange
        }


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url key =
    ( { navKey = key
      , route = toRoute url
      , layout = toLayout url
      , toggles = Dict.empty
      , selectRaw = ""
      , catechisms = notAsked
      , showPicker = False
      }
    , Cmd.batch
        [ Cmd.map ReceiveWSC (RD.sendRequest getWSC)
        , Cmd.map ReceiveWLC (RD.sendRequest getWLC)
        ]
    )


type Msg
    = ClickedLink Browser.UrlRequest
    | UrlChange Url.Url
    | SelectTextUpdated String
    | ShowFullAnswer Int
    | HideFullAnswer Int
    | ShowLetters Int
    | HideLetters Int
    | ReceiveWSC (RD.WebData Catechism)
    | ReceiveWLC (RD.WebData Catechism)
    | TogglePicker


type ToggleState
    = NoAnswer
    | JustLetters
    | FullAnswer


type alias Toggles =
    Dict Int ToggleState


type alias Model =
    { navKey : Nav.Key
    , route : Route
    , layout : Layout
    , toggles : Toggles
    , selectRaw : String
    , catechisms : Catechisms
    , showPicker : Bool
    }


type alias Flags =
    { width : Int, height : Int }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ShowFullAnswer num ->
            ( { model | toggles = Dict.insert num FullAnswer model.toggles }
            , Cmd.none
            )

        HideFullAnswer num ->
            ( { model | toggles = Dict.insert num NoAnswer model.toggles }
            , Cmd.none
            )

        ShowLetters num ->
            ( { model | toggles = Dict.insert num JustLetters model.toggles }
            , Cmd.none
            )

        HideLetters num ->
            ( { model | toggles = Dict.insert num NoAnswer model.toggles }
            , Cmd.none
            )

        SelectTextUpdated "" ->
            ( { model | selectRaw = "" }, Cmd.none )
                |> goToRoute (getToRoute model.route Nothing)

        SelectTextUpdated raw ->
            case String.toInt raw of
                Nothing ->
                    ( { model | selectRaw = raw }, Cmd.none )
                        |> goToRoute (getToRoute model.route Nothing)

                Just num ->
                    ( { model | selectRaw = raw }, Cmd.none )
                        |> goToRoute (getToRoute model.route <| Just num)

        UrlChange url ->
            let
                newRoute =
                    toRoute url
            in
            ( { model
                | route = newRoute
                , selectRaw =
                    routeToMaybeSelected newRoute
                        |> Maybe.withDefault model.selectRaw
                , toggles = Dict.empty
                , showPicker = False
              }
            , Cmd.none
            )

        ClickedLink urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model
                    , Nav.pushUrl model.navKey (Url.toString url)
                    )

                Browser.External url ->
                    ( model
                    , Nav.load url
                    )

        ReceiveWSC wdWSC ->
            ( { model | catechisms = updateWSC wdWSC model.catechisms }, Cmd.none )

        ReceiveWLC wdWLC ->
            ( { model | catechisms = updateWLC wdWLC model.catechisms }, Cmd.none )

        TogglePicker ->
            ( { model | showPicker = not model.showPicker }, Cmd.none )


routeToMaybeSelected : Route -> Maybe String
routeToMaybeSelected route =
    case route of
        WSC (Just num) ->
            Just (String.fromInt num)

        WLC (Just num) ->
            Just (String.fromInt num)

        _ ->
            Nothing


goToRoute : Route -> ( Model, Cmd msg ) -> ( Model, Cmd msg )
goToRoute route ( model, cmd ) =
    ( model
    , Cmd.batch
        [ cmd
        , Nav.pushUrl model.navKey (fromRoute model.layout route)
        ]
    )


getToRoute : Route -> (Maybe Int -> Route)
getToRoute route =
    case route of
        About ->
            \_ -> About

        WSC _ ->
            WSC

        WLC _ ->
            WLC


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


view : Model -> Browser.Document Msg
view model =
    { title = Route.toTitle model.route
    , body = body model
    }


body : Model -> List (Html Msg)
body model =
    [ Html.div
        [ TW.w_full
        , TW.min_h_screen
        , TW.bg_gray_200
        , TW.font_sans
        ]
      <|
        [ Html.div [ TW.flex, TW.flex_col, TW.min_h_screen ]
            [ navbar model
            , case mainView model of
                RD.NotAsked ->
                    loader

                RD.Loading ->
                    loader

                RD.Failure error ->
                    failure error

                RD.Success content ->
                    content
            , footer model
            ]
        ]
    ]


footer : Model -> Html msg
footer { layout } =
    case layout of
        Extension ->
            Html.text ""

        Browser ->
            Html.footer
                [ TW.bg_blue_600
                , TW.h_24
                , TW.flex
                , TW.flex_col
                , TW.text_center
                , TW.text_white
                , TW.italic
                , TW.justify_center
                , TW.w_full
                ]
                [ Html.text "Provided by "
                , Html.a
                    [ A.href "https://yetanothersermon.host/?utm_source=shortercatapp"
                    , TW.hover_underline
                    ]
                    [ Html.text "Yet Another Sermon Host" ]
                ]


navbar : Model -> Html Msg
navbar { layout, route } =
    case layout of
        Extension ->
            Html.text ""

        Browser ->
            Html.div [ TW.font_semibold, TW.bg_white, TW.shadow, TW.w_full, TW.md_px_8, TW.mb_8 ]
                [ Html.nav [ TW.relative, TW.flex, TW.flex_wrap, TW.items_center, TW.justify_between, TW.md_py_4, TW.h_16, TW.px_2 ]
                    [ Html.div [] [ Html.text <| Route.toTitle route ]
                    , Html.a [ A.href <| fromRoute layout About ] [ Html.text "About" ]
                    ]
                ]


mainView : Model -> RD.WebData (Html Msg)
mainView model =
    if model.showPicker then
        RD.Success <| picker model.layout

    else
        let
            qaList_ =
                qaList
                    model.selectRaw
                    model.toggles
        in
        case model.route of
            About ->
                about model
                    |> RD.Success

            WSC maybeNum ->
                RD.map (qaList_ maybeNum) model.catechisms.wsc

            WLC maybeNum ->
                RD.map (qaList_ maybeNum) model.catechisms.wlc



-- Catechism View


selectQ : Catechism -> String -> Html Msg
selectQ catechism selectRaw =
    Html.label [ TW.block, TW.mx_auto, TW.w_3over5, TW.mb_12 ]
        [ Html.span [ TW.font_medium, TW.text_lg, TW.text_gray_800, TW.hidden ] [ Html.text "Select a question" ]
        , Html.input
            [ E.onInput SelectTextUpdated
            , A.type_ "number"
            , A.min "1"
            , A.max <| String.fromInt <| List.length catechism
            , A.value selectRaw
            , A.placeholder "Type to select a question..."
            , TW.form_input
            , TW.text_lg
            , TW.lg_text_5xl
            , TW.rounded
            , TW.rounded_lg
            , TW.mt_1
            , TW.block
            , TW.w_full
            ]
            []
        ]


qaList : String -> Toggles -> Maybe Int -> Catechism -> Html Msg
qaList selectRaw toggles maybeSelectedNum catechism =
    qaListHelp
        { maybeSelectedNum = maybeSelectedNum
        , selectRaw = selectRaw
        , toggles = toggles
        , catechism = catechism
        }


qaListHelp :
    { maybeSelectedNum : Maybe Int
    , selectRaw : String
    , toggles : Toggles
    , catechism : Catechism
    }
    -> Html Msg
qaListHelp { maybeSelectedNum, selectRaw, toggles, catechism } =
    Html.div
        [ TW.mx_auto
        , TW.container
        , TW.px_4
        , TW.flex_grow
        ]
        [ Html.div []
            [ selectQ catechism selectRaw
            , Html.div
                [ TW.flex
                , TW.flex_wrap
                , TW.neg_mx_2
                ]
              <|
                (catechism
                    |> filterBySelected maybeSelectedNum
                    |> List.map (catQ toggles)
                )
            ]
        ]


catQ : Toggles -> ( Int, Question ) -> Html Msg
catQ toggles ( num, { question, answer } ) =
    let
        toggleState =
            Maybe.withDefault NoAnswer (Dict.get num toggles)
    in
    Html.div
        [ TW.w_full
        , TW.md_w_1over2
        , TW.lg_w_1over3
        , TW.xl_w_1over4
        , TW.px_2
        , TW.mb_4
        ]
        [ Html.div
            [ TW.bg_white
            , TW.h_full
            , TW.flex
            , TW.flex_col
            , TW.justify_between
            , TW.rounded
            , TW.shadow
            , TW.rounded_lg
            , TW.border_blue_100
            , TW.border
            ]
            [ Html.div [ TW.p_4 ]
                [ Html.div
                    [ TW.font_bold
                    , TW.text_lg
                    , TW.underline
                    , TW.mb_2
                    , A.style "font-variant-ligatures" "common-ligatures"
                    ]
                    [ Html.text <| "Q" ++ String.fromInt num ]
                , Html.div [ TW.italic ]
                    [ Html.text question ]
                , Html.div
                    [ TW.text_justify
                    , TW.py_6
                    , case toggleState of
                        FullAnswer ->
                            TW.select_auto

                        JustLetters ->
                            TW.select_none

                        NoAnswer ->
                            TW.select_none
                    ]
                    (answerView toggleState answer)
                ]
            , Html.div [ TW.w_full, TW.flex, TW.pt_4 ] <|
                case toggleState of
                    NoAnswer ->
                        [ button (ShowLetters num) "Letters"
                        , button (ShowFullAnswer num) "Full Answer"
                        ]

                    JustLetters ->
                        [ button (HideLetters num) "Hide"
                        , button (ShowFullAnswer num) "Full Answer"
                        ]

                    FullAnswer ->
                        [ button (ShowLetters num) "Letters"
                        , button (HideFullAnswer num) "Hide"
                        ]
            ]
        ]


answerView : ToggleState -> String -> List (Html msg)
answerView toggleState answer =
    case toggleState of
        NoAnswer ->
            [ Html.div [ TW.text_white ] [ Html.text answer ] ]

        JustLetters ->
            answerViewHelp { first = TW.text_blue_800, rest = TW.text_white } answer

        FullAnswer ->
            answerViewHelp { first = TW.text_blue_800, rest = TW.text_blue_800 } answer


answerViewHelp : { first : Html.Attribute msg, rest : Html.Attribute msg } -> String -> List (Html msg)
answerViewHelp colours answer =
    answer
        |> String.split " "
        |> List.map splitWords
        |> List.concatMap (wordView colours)


wordView : { first : Html.Attribute msg, rest : Html.Attribute msg } -> ( String, String ) -> List (Html msg)
wordView colours ( letter, rest ) =
    [ Html.span [ colours.first ] [ Html.text letter ]
    , Html.span [ colours.rest ] [ Html.text rest ]
    ]


splitWords : String -> ( String, String )
splitWords str =
    ( String.left 1 str, String.dropLeft 1 str ++ " " )



-- Picker


picker : Layout -> Html msg
picker layout =
    Html.div
        [ TW.h_full
        , TW.w_screen
        , TW.text_center
        , TW.flex
        , TW.flex_col
        , TW.justify_center
        , TW.font_medium
        , TW.text_2xl
        , TW.font_bold
        ]
        [ Html.a [ TW.my_16, A.href <| fromRoute layout <| WSC Nothing ] [ Html.text "Westminster Shorter Catechism" ]
        , Html.a [ TW.my_16, A.href <| fromRoute layout <| WLC Nothing ] [ Html.text "Westminster Larger Catechism" ]
        ]



-- About


about : Model -> Html msg
about model =
    Html.div
        [ TW.container
        , TW.max_w_lg
        , TW.leading_normal
        , TW.mx_auto
        , TW.m_32
        ]
        [ Html.a [ TW.font_mono, A.href <| fromRoute model.layout <| WSC Nothing ] [ Html.text "Go Back" ]
        , Html.h2 [ TW.mt_4, TW.font_bold, TW.text_lg ] [ header "This app" ]
        , listItem [ Html.text " Simple" ]
        , listItem [ Html.text " Fast" ]
        , listItem [ Html.text " Works Offline" ]
        , listItem [ Html.text " Mobile friendly" ]
        , listItem [ Html.text " ", newTabLink [] { label = Html.text "Open Source", url = "https://github.com/monty5811/shortercat" } ]
        , listItem [ Html.text " ", newTabLink [] { label = Html.text "Twitter", url = "https://twitter.com/ShorterCatApp" } ]
        , Html.h2 [ TW.mt_4, TW.font_bold, TW.text_lg ] [ header "Westminster Shorter Catechism" ]
        , listItem
            [ Html.text
                " The Westminster Shorter Catechism was completed in 1647 by the Westminster Assembly (the same body that wrote the Westminster Confession of Faith. It is part of the confessional standards of many Presbyterian churches"
            ]
        , listItem [ Html.text " ", newTabLink [] { label = Html.text "More resources", url = "https://www.monergism.com/topics/creeds-and-confessions/westminster-assembly/shorter-catechism" } ]
        , listItem [ Html.text " ", newTabLink [] { label = Html.text "Buy a hard copy", url = "https://amzn.to/2JdHUa1" } ]
        ]


listItem : List (Html msg) -> Html msg
listItem elems =
    Html.div [ TW.pl_4 ] elems



-- View Helpers


loader : Html msg
loader =
    Html.div [ TW.h_screen, TW.w_screen, TW.flex, TW.text_center, TW.justify_center ] [ Html.text "Loading..." ]


failure : Http.Error -> Html msg
failure error =
    Html.div
        []
        [ Html.div [] [ Html.text "Uh oh, something went wrong there. Try reloading the page..." ]
        , Html.div []
            [ Html.text <|
                case error of
                    Http.Timeout ->
                        "Time out. Too slow!!"

                    Http.BadUrl _ ->
                        "Invalid Url. Woops!"

                    Http.NetworkError ->
                        "Something happened to the network connection!"

                    Http.BadStatus resp ->
                        String.fromInt resp.status.code ++ ": " ++ resp.status.message

                    Http.BadPayload err _ ->
                        err
            ]
        ]


button : Msg -> String -> Html Msg
button tagger text =
    Html.div
        [ E.onClick tagger
        , TW.rounded
        , TW.rounded_lg
        , TW.m_2
        , TW.bg_blue_500
        , TW.hover_bg_blue_900
        , TW.text_white
        , TW.w_1over2
        , TW.cursor_pointer
        , TW.text_center
        , TW.select_none
        ]
        [ Html.text text ]


newTabLink : List (Html.Attribute msg) -> { url : String, label : Html msg } -> Html msg
newTabLink attrs link =
    Html.a ([ A.href link.url, TW.underline ] ++ attrs) [ link.label ]


header : String -> Html msg
header text =
    Html.h1
        [ TW.font_bold
        , TW.text_xl
        ]
        [ Html.text text ]



-- Helpers


groupInto : Int -> List a -> List (List a)
groupInto num l =
    List.foldl (groupIntoHelp num) [] l


groupIntoHelp : Int -> a -> List (List a) -> List (List a)
groupIntoHelp num item new =
    case List.reverse new of
        [] ->
            [ [ item ] ]

        last :: revRest ->
            List.reverse <|
                if List.length last < num then
                    (last ++ [ item ]) :: revRest

                else
                    [ item ] :: last :: revRest

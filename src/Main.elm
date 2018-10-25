module Main exposing (main)

import Browser
import Browser.Events
import Browser.Navigation as Nav
import Data.WSC as WSC
import Dict exposing (Dict)
import Element as El
import Element.Background as Background
import Element.Border as Border
import Element.Events as Events
import Element.Font as Font
import Element.Input as Input
import Element.Region as Region
import Html exposing (Html)
import Html.Attributes
import Palette as P
import Route exposing (Route(..), fromRoute, toRoute)
import Url


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = ClickedLink
        , onUrlChange = UrlChange
        }


init : Flags -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    ( { navKey = key
      , device = El.classifyDevice { width = flags.width, height = flags.height }
      , route = toRoute url
      , toggles = Dict.empty
      , selectRaw = ""
      , wsc = WSC.data
      }
    , Cmd.none
    )


type Msg
    = ClickedLink Browser.UrlRequest
    | UrlChange Url.Url
    | WindowResize Int Int
    | SelectTextUpdated String
    | ShowFullAnswer Int
    | HideFullAnswer Int
    | ShowLetters Int
    | HideLetters Int


type ToggleState
    = NoAnswer
    | JustLetters
    | FullAnswer


type alias Model =
    { navKey : Nav.Key
    , device : El.Device
    , route : Route
    , toggles : Dict Int ToggleState
    , selectRaw : String
    , wsc : List ( Int, WSC.Question )
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
                |> goToRoute (WSC Nothing)

        SelectTextUpdated raw ->
            case String.toInt raw of
                Nothing ->
                    ( { model | selectRaw = raw }, Cmd.none )
                        |> goToRoute (WSC Nothing)

                Just num ->
                    ( { model | selectRaw = raw }, Cmd.none )
                        |> goToRoute (WSC <| Just num)

        UrlChange url ->
            let
                newRoute =
                    toRoute url
            in
            ( { model
                | route = newRoute
                , selectRaw =
                    routeToSelectRaw newRoute
                        |> Maybe.withDefault model.selectRaw
                , toggles = Dict.empty
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

        WindowResize width height ->
            ( { model | device = El.classifyDevice { width = width, height = height } }
            , Cmd.none
            )


routeToSelectRaw : Route -> Maybe String
routeToSelectRaw route =
    case route of
        WSC (Just num) ->
            Just (String.fromInt num)

        _ ->
            Nothing


goToRoute : Route -> ( Model, Cmd msg ) -> ( Model, Cmd msg )
goToRoute route ( model, cmd ) =
    ( model
    , Cmd.batch
        [ cmd
        , Nav.pushUrl model.navKey (fromRoute route)
        ]
    )


view : Model -> Browser.Document Msg
view model =
    { title = "Westminster Shorter Catechism"
    , body = body model
    }


body : Model -> List (Html Msg)
body model =
    [ El.layout
        [ El.width El.fill
        , El.height El.fill
        , El.centerX
        , El.centerY
        , El.clipY
        , El.scrollbarY
        , Font.family [ Font.typeface "Montserrat" ]
        , Background.color P.blue
        ]
      <|
        El.column [ El.width El.fill ]
            [ navbar model
            , mainView model
            ]
    ]


navbar : Model -> El.Element msg
navbar { device } =
    El.row
        [ Region.navigation
        , El.alignTop
        , El.width El.fill
        , El.padding P.lg
        , Background.color P.darkBlue
        , case device.class of
            El.Phone ->
                Font.size P.lg

            El.Tablet ->
                Font.size P.lg

            El.Desktop ->
                Font.size P.xl

            El.BigDesktop ->
                Font.size P.xl
        , Font.color P.red
        , Font.italic
        , Font.variant Font.ligatures
        ]
        [ El.link [ El.centerX, Font.bold ]
            { label = El.text "Westminster Shorter Catechism", url = fromRoute <| WSC Nothing }
        , El.link [ El.alignRight ]
            { label = El.text "About", url = fromRoute About }
        ]


mainView : Model -> El.Element Msg
mainView model =
    El.el
        [ Region.mainContent
        , El.spacing P.xxl
        , El.padding P.xxl
        , El.centerX
        , El.width El.fill
        ]
    <|
        case model.route of
            About ->
                about model

            WSC maybeNum ->
                wscList maybeNum model


about : Model -> El.Element msg
about model =
    El.textColumn
        [ Region.mainContent
        , Font.color P.white
        , El.spacing P.lg
        , El.padding P.xl
        , El.width El.fill
        , Background.color P.darkBlue
        , Border.solid
        , Border.color P.red
        , Border.width 1
        , El.centerX
        , El.width <|
            case model.device.class of
                El.Phone ->
                    El.fill

                El.Tablet ->
                    El.fill

                El.Desktop ->
                    El.px 1000

                El.BigDesktop ->
                    El.px 1000
        ]
        [ El.paragraph [] [ header "This app" ]
        , listItem [ El.text "• Simple" ]
        , listItem [ El.text "• Fast" ]
        , listItem [ El.text "• Works Offline" ]
        , listItem [ El.text "• Mobile friendly" ]
        , listItem [ El.text "• ", newTabLink [] { label = El.text "Open Source", url = "https://github.com/monty5811/shortercat" } ]
        , listItem [ El.text "• ", newTabLink [] { label = El.text "Twitter", url = "https://twitter.com/ShorterCatApp" } ]
        , El.paragraph [] [ header "Westminster Shorter Catechism" ]
        , listItem
            [ El.text
                "• The Westminster Shorter Catechism was completed in 1647 by the Westminster Assembly (the same body that wrote the Westminster Confession of Faith. It is part of the confessional standards of many Presbyterian churches"
            ]
        , listItem [ El.text "• ", newTabLink [] { label = El.text "More resources", url = "https://www.monergism.com/topics/creeds-and-confessions/westminster-assembly/shorter-catechism" } ]
        , listItem [ El.text "• ", newTabLink [] { label = El.text "Buy a hard copy", url = "https://amzn.to/2JdHUa1" } ]
        ]


listItem : List (El.Element msg) -> El.Element msg
listItem elems =
    El.paragraph
        [ El.paddingEach
            { top = 0
            , bottom = 0
            , right = 0
            , left = P.lg
            }
        ]
        elems


newTabLink : List (El.Attribute msg) -> { url : String, label : El.Element msg } -> El.Element msg
newTabLink attrs link =
    El.newTabLink (Font.underline :: attrs) link


header : String -> El.Element msg
header text =
    El.el
        [ Region.heading 1
        , Font.size P.xl
        , Font.bold
        ]
        (El.text text)


selectQ : Model -> El.Element Msg
selectQ model =
    Input.text
        [ El.width El.fill
        , Background.color P.darkBlue
        , Font.color P.red
        , Border.color P.lightBlue
        , El.focused [ Border.color P.red ]
        ]
        { onChange = SelectTextUpdated
        , text = model.selectRaw
        , placeholder = Just (Input.placeholder [ Font.color P.white ] <| El.text "Type to select a question...")
        , label = Input.labelHidden "Select a question"
        }


wscList : Maybe Int -> Model -> El.Element Msg
wscList maybeNum model =
    case model.device.class of
        El.Phone ->
            wscListHelp maybeNum El.fill 1 model

        El.Tablet ->
            wscListHelp maybeNum El.fill 2 model

        El.Desktop ->
            wscListHelp maybeNum (El.px 1000) 3 model

        El.BigDesktop ->
            wscListHelp maybeNum (El.px 1000) 3 model


wscListHelp : Maybe Int -> El.Length -> Int -> Model -> El.Element Msg
wscListHelp maybeNum width numPerRow model =
    El.column
        [ El.width width
        , El.centerX
        , El.spacing P.md
        ]
    <|
        selectQ model
            :: (model.wsc
                    |> filterBySelected maybeNum
                    |> groupInto numPerRow
                    |> List.map (makeRow model)
               )


filterBySelected : Maybe Int -> List ( Int, WSC.Question ) -> List ( Int, WSC.Question )
filterBySelected maybeNum data =
    case maybeNum of
        Just num ->
            List.filter (\( k, _ ) -> k == num) data

        Nothing ->
            data


makeRow : Model -> List ( Int, WSC.Question ) -> El.Element Msg
makeRow model qs =
    El.row [ El.width El.fill ] <| List.map (catQ model) qs


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


catQ : Model -> ( Int, WSC.Question ) -> El.Element Msg
catQ { toggles } ( num, { question, answer } ) =
    let
        toggleState =
            Maybe.withDefault NoAnswer (Dict.get num toggles)

        bg =
            P.darkBlue
    in
    El.column
        [ El.padding P.lg
        , El.spacing P.lg
        , El.width El.fill
        , El.height El.fill
        , Border.solid
        , Border.width P.xxs
        , Border.rounded P.xxs
        , Border.color P.lightBlue
        , Background.color bg
        , Font.color P.white
        ]
        [ El.row
            [ Region.heading 1
            , El.width El.fill
            , El.width El.fill
            , Font.variant Font.ligatures
            , Font.size P.xxl
            , Font.bold
            , Font.underline
            ]
            [ El.text <| "Q" ++ String.fromInt num ]
        , El.row
            [ El.width El.fill
            , El.spacingXY 0 P.lg
            ]
            [ El.paragraph [ Font.alignLeft, Font.italic, El.spacing P.sm ] [ El.text question ] ]
        , El.row
            [ El.width El.fill
            , El.spacingXY 0 P.lg
            ]
            [ El.paragraph
                [ Font.justify
                , El.spacing P.sm
                ]
              <|
                answerView bg toggleState answer
            ]
        , El.row
            [ El.width El.fill
            , El.alignBottom
            , El.spacing P.sm
            ]
          <|
            case toggleState of
                NoAnswer ->
                    [ button (ShowLetters num) "Letters Only"
                    , button (ShowFullAnswer num) "Full Answer"
                    ]

                JustLetters ->
                    [ button (HideLetters num) "Hide"
                    , button (ShowFullAnswer num) "Full Answer"
                    ]

                FullAnswer ->
                    [ button (ShowLetters num) "Letters Only"
                    , button (HideFullAnswer num) "Hide Answer"
                    ]
        ]


button : Msg -> String -> El.Element Msg
button tagger text =
    Input.button
        [ El.width El.fill
        , El.padding P.xs
        , Background.color P.blue
        , Border.rounded P.xs
        , El.pointer
        , El.htmlAttribute <| Html.Attributes.style "user-select" "none"
        , El.focused
            [ Border.color P.blue
            ]
        ]
        { onPress = Just tagger
        , label = El.el [ El.centerX ] <| El.text text
        }


answerView : El.Color -> ToggleState -> String -> List (El.Element msg)
answerView bg toggleState answer =
    case toggleState of
        NoAnswer ->
            [ El.el [ Font.color bg ] <| El.text answer ]

        JustLetters ->
            answerViewHelp { first = P.white, rest = bg } answer

        FullAnswer ->
            answerViewHelp { first = P.white, rest = P.white } answer


answerViewHelp : { first : El.Color, rest : El.Color } -> String -> List (El.Element msg)
answerViewHelp colours answer =
    answer
        |> String.split " "
        |> List.map splitWords
        |> List.concatMap (wordView colours)


splitWords : String -> ( String, String )
splitWords str =
    ( String.left 1 str, String.dropLeft 1 str ++ " " )


wordView : { first : El.Color, rest : El.Color } -> ( String, String ) -> List (El.Element msg)
wordView colours ( letter, rest ) =
    [ El.el [ Font.color colours.first ] (El.text letter)
    , El.el [ Font.color colours.rest ] (El.text rest)
    ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Browser.Events.onResize WindowResize

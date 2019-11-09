module Data exposing
    ( Catechism
    , Catechisms
    , Question
    , filterBySelected
    , getWLC
    , getWSC
    , notAsked
    , updateWLC
    , updateWSC
    )

import Http
import Json.Decode as JD
import RemoteData as RD


type alias Catechisms =
    { wsc : RD.WebData Catechism
    , wlc : RD.WebData Catechism
    }


type alias Catechism =
    List ( Int, Question )


type alias Question =
    { question : String
    , answer : String
    }


notAsked : Catechisms
notAsked =
    { wsc = RD.NotAsked
    , wlc = RD.NotAsked
    }


updateWSC : RD.WebData Catechism -> Catechisms -> Catechisms
updateWSC newCat catechisms =
    { catechisms | wsc = newCat }


updateWLC : RD.WebData Catechism -> Catechisms -> Catechisms
updateWLC newCat catechisms =
    { catechisms | wlc = newCat }



-- Decoding


decodeCatechism : JD.Decoder Catechism
decodeCatechism =
    JD.list decodeQuestion


decodeQuestion : JD.Decoder ( Int, Question )
decodeQuestion =
    JD.map3 toQ
        (JD.field "num" JD.int)
        (JD.field "question" JD.string)
        (JD.field "answer" JD.string)


toQ : Int -> String -> String -> ( Int, Question )
toQ num q a =
    ( num, Question q a )



-- Requests


getWSC : Http.Request Catechism
getWSC =
    Http.get "/data/wsc.json" decodeCatechism


getWLC : Http.Request Catechism
getWLC =
    Http.get "/data/wlc.json" decodeCatechism



-- Helpers


filterBySelected : Maybe Int -> List ( Int, Question ) -> List ( Int, Question )
filterBySelected maybeNum data =
    case maybeNum of
        Just num ->
            List.filter (\( k, _ ) -> k == num) data

        Nothing ->
            data

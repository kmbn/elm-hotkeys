-- Example of how onEnterSend can be used.


module Main exposing (..)

import Html exposing (Attribute, beginnerProgram, div, input, text)
import Html.Attributes exposing (autofocus, placeholder, value)
import Hotkeys exposing (onEnterSend)


main =
    beginnerProgram { model = model, view = view, update = update }



-- MODEL


type alias Model =
    { string : String, cleared : Bool }


model =
    { string = "No content yet", cleared = False }



-- UPDATE


type Msg
    = NewContent String


update msg model =
    case msg of
        NewContent content ->
            { model | string = content, cleared = True }



-- VIEW


view model =
    div []
        [ input (attributes model.cleared) []
        , div [] [ text model.string ]
        ]


attributes cleared =
    [ autofocus True, placeholder "Enter content", onEnterSend NewContent ]
        ++ (if cleared then
                [ value "" ]
            else
                []
           )

module Hotkeys exposing
    ( onKeyCode
    , onEnter
    , onEnterSend
    )

{-| Event handlers for sending content and triggering actions with keypresses.

@docs onKeyCode

@docs onEnter

@docs onEnterSend

-}

import Html
import Html.Events
import Json.Decode


{-| Construct an event handler for any keycode. Send a Msg when the given key
is pressed.

(You can use <http://keycode.info> to find the keycode
for a given key.)

Examples:

    input [ onKeyCode 13 EnterWasPressed ] []

    input [ onKeyCode 17 ControlWasPressed ] []

-}
onKeyCode : Int -> msg -> Html.Attribute msg
onKeyCode expectedCode msg =
    let
        isExpectedCode currentCode =
            if currentCode == expectedCode then
                Json.Decode.succeed msg

            else
                Json.Decode.fail ("not " ++ toString expectedCode)
    in
    Html.Events.on "keydown"
        (Json.Decode.andThen isExpectedCode Html.Events.keyCode)


{-| Send a Msg when enter is pressed. This is a convenience function that
wraps `onKeyCode`.

Examples:

    input [ placeholder "Enter example", onEnter CheckExample ] []

    input [ placeholder "Enter example", onEnter (Update example.id) ] []

-}
onEnter : msg -> Html.Attribute msg
onEnter msg =
    onKeyCode 13 msg


{-| Send content only when enter is pressed. Do not send anything beforehand.

This is an alternative to using `Html.Events.onInput` to update the model with
incomplete content on every keystroke and then using another event handler to
indicate that the content collected in the model is now complete.

Instead, we only send content to `update` when the content is ready to be
consumed.

Example:

    input [ placeholder "Enter content", onEnterSend NewContent ] []

See `../examples/onEnterSend.elm` for a working example.

-}
onEnterSend : (String -> msg) -> Html.Attribute msg
onEnterSend msg =
    let
        isEnter code =
            if code == 13 then
                Json.Decode.map msg Html.Events.targetValue

            else
                Json.Decode.fail "not ENTER"
    in
    Html.Events.on "keydown"
        (Json.Decode.andThen isEnter Html.Events.keyCode)

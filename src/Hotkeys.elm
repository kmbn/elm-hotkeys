module Hotkeys exposing (onEnterSend)

{-| Event handlers for sending content and triggering actions with keypresses.

@docs onEnterSend

-}

import Html
import Html.Events as Events
import Json.Decode


{-| Send content only when enter is pressed. Do not send anything beforehand.

This is an alternative to using `Html.Events.onInput` to update the model with
incomplete content on every keystroke and then using another event handler to
indicate that the content collected in the model is now complete.

Instead, we only send content to `update` when the content is ready to be
consumed.

    input [ placeholder "Enter content", onEnterSend NewContent ] []

See `../examples/onEnterSend.elm` for a working example.

-}
onEnterSend : (String -> msg) -> Html.Attribute msg
onEnterSend msg =
    let
        isEnter code =
            if code == 13 then
                Json.Decode.map msg Events.targetValue
            else
                Json.Decode.fail "not ENTER"
    in
        Events.on "keydown" (Json.Decode.andThen isEnter Events.keyCode)

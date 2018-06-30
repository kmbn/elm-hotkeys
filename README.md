# elm-hotkeys

[![MIT License](https://img.shields.io/github/license/kmbn/elm-hotkeys.svg?style=flat-square)](https://raw.githubusercontent.com/kmbn/elm-hotkeys/master/LICENSE)

Event handlers for sending content and triggering actions based on keypresses.

## Install
```
elm package install kmbn/elm-hotkeys
```

## Import
```
import Hotkeys exposing (onEnterSend)
```

## Use
```
input [ placeholder "Enter content", onEnterSend NewContent ] []
```

See `../examples/onEnterSend.elm` for a working example

## Functions
### onEnterSend
Send content only when enter is pressed. Do not send anything beforehand.

This is an alternative to using `Html.Events.onInput` to update the model with
incomplete content on every keystroke and then using another event handler to
indicate that the content collected in the model is now complete.

Instead, we only send content to `update` when the content is ready to be
consumed.

## License
MIT

## Copyright
&copy; 2018 Kevin Brochet-Nguyen
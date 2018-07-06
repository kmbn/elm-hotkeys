# elm-hotkeys

[![MIT License](https://img.shields.io/github/license/kmbn/elm-hotkeys.svg?style=flat-square)](https://raw.githubusercontent.com/kmbn/elm-hotkeys/master/LICENSE)
[![Travis](https://img.shields.io/travis/kmbn/elm-hotkeys.svg?style=flat-square)](https://travis-ci.org/kmbn/elm-hotkeys)

Event handlers for sending content and triggering actions based on keypresses.

## Install
```
elm package install kmbn/elm-hotkeys
```

## Import
```
import Hotkeys
    exposing
        ( onKeyCode
        , onEnter
        , onEnterSend
        )
```

## Use
```
input [ onKeyCode 13 EnterWasPressed ] []
input [ onEnter EnterWasPressed ] []
input [ placeholder "Enter new content", onEnterSend NewContent ] []
```

See `../examples/onEnterSend.elm` for a working example of `onEnterSend`.

## Functions
### onKeyCode
Construct an event handler for any keycode. Send a Msg when the given key is pressed.

(You can use [<http://keycode.info>](http://keycode.info) to find the keycode for a given key.)

### onEnter
Send a Msg when enter is pressed. This is a convenience function that wraps `onKeyCode`.

### onEnterSend
Send content only when enter is pressed. Do not send anything beforehand.

This is an alternative to using `Html.Events.onInput` to update the model with incomplete content on every keystroke and then using another event handler to indicate that the content collected in the model is now complete.

Instead, we only send content to `update` when the content is ready to be consumed.

## License
MIT

## Copyright
&copy; 2018 Kevin Brochet-Nguyen
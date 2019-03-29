module Example exposing (..)

import Expect
import Test exposing (Test, describe, test)


suite : Test
suite =
    describe "Example test suite"
        [ test "This is not that"
            (\_ ->
                Expect.false
                    "Expected this to be different from that"
                    ("this" == "that")
            )
        ]

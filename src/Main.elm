module Pfennig.Main where

import Html as H
import Html.Attributes as A
import Html.Events(..)
import List
import Signal
import String
import Text(..)

type alias Model = Int

type Action = NoOp

updates : Signal.Channel Action
updates = Signal.channel NoOp

initialModel : Model
initialModel = 0

update : Action -> Model -> Model
update action model =
    case action of
      NoOp -> model

model : Signal Model
model = Signal.foldp update initialModel (Signal.subscribe updates)

view : Model -> H.Html
view model =
  H.form [A.class "new-expense column"]
    [H.div [A.class "row"]
       [H.label [A.for "hello"] [H.text "hello!"],
        H.input [A.id "hello"] []],
     H.div [A.class "row"]
       [H.label [A.for "world"] [H.text "world!"],
        H.input [A.id "world", A.type' "date"] []]]

main : Signal H.Html
main = Signal.map view model

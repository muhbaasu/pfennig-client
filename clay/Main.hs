{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Clay              hiding ((**))
import           Clay.Size
import qualified Data.Text.Lazy.IO as LIO

main :: IO ()
main = do
  let css = render pfennig
  LIO.writeFile "./assets/generated.css" css

pfennig :: Css
pfennig = do
  body ? do
    background white

  star ? do
    boxSizing borderBox

  form |> ".row" ? do
    display flex

    label <? do
      width $ pct 25

    input <? do
      width $ pct 75

  ".row" ? do
    display flex
    flexDirection row

  ".column" ? do
    display flex
    flexDirection column

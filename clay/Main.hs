{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Clay
import qualified Data.Text.Lazy.IO as LIO

main :: IO ()
main = do
  let css = render pfennig
  LIO.writeFile "./assets/generated.css" css

pfennig :: Css
pfennig = body ? background white

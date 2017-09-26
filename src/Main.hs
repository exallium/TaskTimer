{-# LANGUAGE RecordWildCards #-}

module Main where

import Options.Applicative
import Data.Semigroup ((<>))
import OptParser
import Timer

main :: IO ()
main = do
  TimerTaskInfo {..} <- execParser opts
  timeNTimes count cmd

  where
    opts = info (optParser <**> helper)
         ( fullDesc
        <> progDesc "Time a command a variable number of times"
        <> header   "TaskTimer -- A quick way to time command output")

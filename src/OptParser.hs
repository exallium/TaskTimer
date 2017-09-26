module OptParser where

import Options.Applicative
import Data.Semigroup ((<>))

data TimerTaskInfo = TimerTaskInfo 
                   { cmd    :: String
                   , count  :: Int
                   }

optParser :: Parser TimerTaskInfo
optParser = TimerTaskInfo
    <$> strOption
      ( long "cmd"
     <> metavar "COMMAND"
     <> short 'c'
     <> help "The Command to run N times")
    <*> option auto
      ( long "count"
     <> metavar "N"
     <> short 'n'
     <> help "The number of times to run the command"
      )
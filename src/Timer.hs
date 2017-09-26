module Timer where

import System.Process
import Data.Semigroup ((<>))

mkTask :: String -> String
mkTask cmd = "time " <> cmd <> " &> /dev/null"

performCmd :: String -> IO String
performCmd cmd = do
    (_, _, err) <- readCreateProcessWithExitCode (shell cmd) ""
    return err

parseTime :: String -> String
parseTime = (!! 1) . words . (!! 1) . lines

timeNTimes :: Int -> String -> IO ()
timeNTimes n cmd = do
    putStrLn $ "Measuring \"" <> cmd <> "\" " <> show n <> " times"
    let cmds = replicate n $ mkTask cmd
    x <- traverse performCmd cmds 
    let time = map parseTime x
    traverse putStrLn time
    putStrLn "done"
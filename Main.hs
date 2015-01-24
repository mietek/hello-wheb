import System.Environment
import Web.Wheb

main :: IO ()
main = do
    env <- getEnvironment
    let port = maybe (8080 :: Int) read
             $ lookup "PORT" env
    opts <- genMinOpts $ do
      addGET "." rootPat $ (text "Hello, world!")
      addSetting' "port" port
    runWhebServer opts

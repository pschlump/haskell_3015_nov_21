import System.Environment   
import Data.List  
  
-- To get name of program in MacOS/Linux/Unix/Solaris: progName <- getProgName  

main = do {
    args <- getArgs ;
    mapM blankAfter args ;
    putStrLn "" ;
    }

blankAfter a = putStr ( a ++ " " )

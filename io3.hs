import Data.List
import System.Environment   
import System.Directory

ls b = do {
    all <- getDirectoryContents b ;
    mapM printAnItem ( sort all ) ;
    }

printAnItem a = if ( a !! 0 ) == '.' 
                    then putStr("")
                    else putStrLn ( a )

lsList [] = return []
lsList (x:xs) = do {
    ls x ;
    lsList xs ;
    return [] ;
    }

main = do {
    args <- getArgs ;
    if ( length args ) < 1
        then ls(".") 
        else lsList args
    }

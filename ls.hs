
import Data.List
import System.Directory

main = do {
   all <- getDirectoryContents "." ;
   print ( sort all ) ;
   }


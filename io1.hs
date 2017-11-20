
import System.IO

main = do  
    putStr "Some Input Please? "  
    hFlush stdout
    txt <- getLine  
    putStrLn ("Echo of ->" ++ txt ++ "<-")  



import System.IO

main = do  
    return ()  
    putStr "Some Input Please? "  
    hFlush stdout
    line <- getLine  
    putStrLn ( "Your input ->" ++ line  ++ "<-" )

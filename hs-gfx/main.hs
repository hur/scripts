module Main where

import Graphics.Gloss
--import Graphics.Gloss.Export.Gif -- for gif export
import Prelude
import Data.Fixed -- For mod' function that works on floats
import System.Environment -- for getArgs
import Data.List -- Last 2 for processing command line arguments. 

-- Command-line argument parsing segment
-- this segment is based on https://stackoverflow.com/a/10007262/
main :: IO () -- main calls argHelper which returns IO () 
main = do
    argHelper =<< getArgs -- Sequentially compose two actions, passing any value produced by the second as an argument to the first. 
                          -- Works opposite of >>=. See docs: https://hackage.haskell.org/package/base-4.12.0.0/docs/Prelude.html#v:-62--62--61- 

-- List of tuples that provides information on which argument should run which animation    
arg_helper_list :: [(String, (Float -> Picture))]
arg_helper_list =  [("1",circles),("2",circles2),("3",circles3),("4",circles4)]

-- Partial application of animate
-- Here you can change window size and background color
run = animate FullScreen black

-- argHelper determines which animation to run
argHelper :: [String] -> IO ()
argHelper []            = run circles -- If no arguments are provided, run the circles function
argHelper (choice:args) = case lookup choice arg_helper_list  of -- lookup finds tuple where first element matches its argument and gives the second argument.
                            Just f  -> run f -- If argument matches, call appropriate function
                            Nothing -> error ("Invalid argument. Arguments: 1-" ++ show (length(arg_helper_list))) -- if argument is invalid, tell correct arguments
-- End command-line argument parsing segment

-- Functions. Using Gloss's animate which takes care of the t parameter (t=time) 
circles :: Float -> Picture         
circles t = Pictures (
                     [( Scale 0.2 0.2 $
                     Color (makeColor (n `mod'` 1) 0.5 0.5 1) $
                     Rotate (n*10) $
                     Translate ((n*75)) ((n*10)) $
                     Circle ((n+0.1)*50)) | n<- [0.0,0.1..density*t], t<60]
                     )
                     where density = 10
circles2 :: Float -> Picture         
circles2 t = Pictures (
                     [(Scale 0.2 0.2 $
                     Color (makeColor (n `mod'` 1) 0.5 0.5 1) $
                     Rotate (n*1000) $
                     Translate (n*75) (n*10) $
                     Circle ((n+0.1)*50)) | n<- [0.0,0.1..density*t], t<60]
                     )
                     where density = 7
                     
circles3 :: Float -> Picture             
circles3 t = Pictures (
                        concat [[Scale 2 2 $
                                 Color white $ 
                                 Rotate (n) $ 
                                 Rotate theta $ 
                                 Translate r r $ 
                                 Circle 10 | r <- [0,10..140]] | n<-[0,5..360]]
                         )
                         where
                            period = 10
                            theta = ((2*pi*t/period)*(180/pi)) -- angle for circular motion converted to degrees 
                         
circles4 :: Float -> Picture         
circles4 t = Pictures (  -- spinny circles
                        --[Rotate (100*(t+n)) $
                        --Translate ((max 0 100*(t-n))) ((max 0 100*(t-n))) $ 
                        --Color white $
                        --ThickCircle 1 (min ((1+(t+n)/10)) 5) | n<-[0,6..t], t<60] ++ 
                        -- white circles 
                        [if even (floor t) then scaleup $
                        Color white $
                        (Arc t t (t+x)) else scaledown $
                        Color white $
                        (Arc t t (t+x)) | x<-[1,100..1920]] ++ 
                        -- top left
                        [if even (floor t) then scaleup $ 
                         Color gr $
                         Translate r (r) $ Rotate (t*10) $ Circle r else scaledown $
                         (Color gr) $
                         Translate (r) r $ Rotate (t*10) $ Circle r | r<-[1,5..1920]] ++ 
                        -- top right
                        [if even (floor t) then scaleup $
                         (Color gr) $
                         Translate (-r) (r) $ Rotate (t*10) $ Circle r else scaledown $
                         (Color gr) $
                         Translate (-r) r $ Rotate (t*10) $ Circle r | r<-[1,5..1920]] ++ 
                        -- bottom left
                         [if even (floor t) then scaleup $ 
                         (Color gr) $
                         Translate (r) (-r) $ Rotate (t*10) $ Circle r else scaledown $
                         (Color gr) $
                         Translate (r) (-r) $ Rotate (t*10) $ Circle r| r<-[1,5..1920]] ++
                         -- bottom right
                         [if even (floor t) then scaleup $ 
                         Color gr $
                         Translate (-r) (-r) $ Rotate (t*10) $ Circle r else scaledown $
                         (Color gr) $
                         Translate (-r) (-r) $ Rotate (t*10) $ Circle r| r<-[1,5..1920]]
                         )
                        where 
                        g = (makeColor (0.3 + (t `mod'` 1)/2) (0.1 + (t `mod'` 1)/2) (0.5 + (t `mod'` 1)/2) 1) --green
                        p = (makeColor (0.7 - (t `mod'` 1)/2) (0.9 - (t `mod'` 1)/2) (0.5 - (t `mod'` 1)/2) 1 ) -- purple
                        gr = (makeColor 1 1 1 0.7) -- white / gray
                        gp = (makeColor (t `mod'` 1) 0.5 0.5 1) --green/red flashing
                        --
                        scaleup = (Scale (0.5 +(t `mod'` 1)/2) ((0.5 +(t `mod'` 1)/2)))
                        scaledown = (Scale (1-(t `mod'` 1)/2) (1-(t `mod'` 1)/2))
                         
                         



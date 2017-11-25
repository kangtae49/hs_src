import Graphics.Win32.Window (c_FindWindow, c_SetWindowLongPtr, showWindow, wS_DISABLED, sW_HIDE)
import Graphics.Win32.LayeredWindow (c_GetWindowLongPtr)
import System.Win32.Types (castUINTPtrToPtr, newTString, INT)
import Data.Bits ((.&.), complement)
import Foreign.Ptr ( nullPtr )

main :: IO ()
main = do
  let gWL_STYLE = -16 :: INT
      enableStyle style = (fromIntegral style) .&. (complement wS_DISABLED)

  s <- newTString "Notepad"
  m <- newTString "메모장 정보"
  w <- c_FindWindow s nullPtr
  p <- c_GetWindowLongPtr w gWL_STYLE 
  q <- c_SetWindowLongPtr w gWL_STYLE (castUINTPtrToPtr (fromIntegral (enableStyle p)))

  w2 <- c_FindWindow nullPtr m
  r <- showWindow w2 sW_HIDE

  putStrLn $ show r


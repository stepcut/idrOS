module Main

kernel_main : IO ()
kernel_main =
  mkForeign (FFun "kernel_main" [] FUnit)

main : IO ()
main =
  kernel_main

import UIKit

var greeting = "Hello, playground"

var index = 10

switch index {
   case 100 :
      print( "Value of index is 100")
   case 10,15 :
      print( "Value of index is either 10 or 15")
   case 5 :
      print( "Value of index is 5")
   default :
      print( "default case")
}

switch index {
    case 100 :
      print( "Value of index is 100")
      fallthrough
    case 40 :
        print( "Value of index is 50")
    case 10,15 :
      print( "Value of index is either 10 or 15")
      fallthrough
    case 50 :
        print( "Value of index is 50")
     fallthrough
    case 5 :
        print( "Value of index is 5")
   default :
      print( "default case")
}


switch index {
    case 100 :
      print( "Value of index is 100")
    case 40 :
        print( "Value of index is 50")
    case 10,15 :
      print( "Value of index is either 10 or 15")
      fallthrough
    case 50 :
        print( "Value of index is 50")
    case 5 :
        print( "Value of index is 5")
   default :
      print( "default case")
}



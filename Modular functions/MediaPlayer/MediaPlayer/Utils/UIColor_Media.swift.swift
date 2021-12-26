import UIKit

extension  UIColor  {
    // return a random color
    class  var  randomColor:  UIColor  {
        get  {
            let  red =  CGFloat (arc4random()%256)/255.0
            let  green =  CGFloat (arc4random()%256)/255.0
            let  blue =  CGFloat (arc4random()%256)/255.0
            return  UIColor (red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
}

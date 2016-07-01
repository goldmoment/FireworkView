//
//  Extention.swift
//  FireworkView
//
//  Created by Vien V.Nguyen on 6/29/16.
//  Copyright © 2016 Vien V.Nguyen. All rights reserved.
//

import UIKit
import CoreGraphics

public extension Int {
  /// Returns a random Int point number between 0 and Int.max.
  public static var random:Int {
    get {
      return Int.random(Int.max)
    }
  }
  /**
   Random integer between 0 and n-1.
   
   - parameter n: Int
   
   - returns: Int
   */
  public static func random(n: Int) -> Int {
    return Int(arc4random_uniform(UInt32(n)))
  }
  /**
   Random integer between min and max
   
   - parameter min: Int
   - parameter max: Int
   
   - returns: Int
   */
  public static func random(min: Int, max: Int) -> Int {
    return Int.random(max - min + 1) + min
    //Int(arc4random_uniform(UInt32(max - min + 1))) + min }
  }
}
public extension Double {
  /// Returns a random floating point number between 0.0 and 1.0, inclusive.
  public static var random:Double {
    get {
      return Double(arc4random()) / 0xFFFFFFFF
    }
  }
  /**
   Create a random number Double
   
   - parameter min: Double
   - parameter max: Double
   
   - returns: Double
   */
  public static func random(min: Double, max: Double) -> Double {
    return Double.random * (max - min) + min
  }
}
public extension Float {
  /// Returns a random floating point number between 0.0 and 1.0, inclusive.
  public static var random:Float {
    get {
      return Float(arc4random()) / 0xFFFFFFFF
    }
  }
  /**
   Create a random num Float
   
   - parameter min: Float
   - parameter max: Float
   
   - returns: Float
   */
  public static func random(min min: Float, max: Float) -> Float {
    return Float.random * (max - min) + min
  }
}
public extension CGFloat {
  /// Randomly returns either 1.0 or -1.0.
  public static var randomSign:CGFloat {
    get {
      return (arc4random_uniform(2) == 0) ? 1.0 : -1.0
    }
  }
  /// Returns a random floating point number between 0.0 and 1.0, inclusive.
  public static var random:CGFloat {
    get {
      return CGFloat(Float.random)
    }
  }
  /**
   Create a random num CGFloat
   
   - parameter min: CGFloat
   - parameter max: CGFloat
   
   - returns: CGFloat random number
   */
  public static func random(min: CGFloat, max: CGFloat) -> CGFloat {
    return CGFloat.random * (max - min) + min
  }
}
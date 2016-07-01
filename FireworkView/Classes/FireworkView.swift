//
//  FireworkView.swift
//  FireworkView
//
//  Created by Vien V.Nguyen on 6/29/16.
//  Copyright © 2016 Vien V.Nguyen. All rights reserved.
//

import UIKit

protocol FireworkViewDelegate {
  func handleTouch(sender: UITapGestureRecognizer)
}

class FireworkView: UIView {
  
  private var colors = [UIColor(red:1.00, green:0.20, blue:0.29, alpha:1.0),
                UIColor(red:0.19, green:1.00, blue:0.65, alpha:1.0),
                UIColor(red:0.13, green:0.43, blue:1.00, alpha:1.0),
                UIColor(red:1.00, green:1.00, blue:0.60, alpha:1.0)]
  private var radius: Float = 20.0
  private var size: Float = 200.0
  private var duration = 0.5
  private var numberOfParticle = 40
  
  var delegate: FireworkViewDelegate?
  
  override init(frame: CGRect) {
    super.init(frame: CGRectZero)
    settup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    settup()
  }
  
  func fireworkWithRadius(radius: Float, size: Float, numberOfParticle: Int, colors: [UIColor], duration: Double) {
    self.radius = radius
    self.numberOfParticle = numberOfParticle
    self.size = size
    self.colors = colors
    self.duration = duration
  }
  
  private func settup() {
    self.backgroundColor = UIColor(red:0.09, green:0.13, blue:0.18, alpha:1.0)
    
    let gesture = UITapGestureRecognizer(target: self, action: #selector(handleTouch))
    self.addGestureRecognizer(gesture)
  }
  
  @objc private func handleTouch(sender: UITapGestureRecognizer) {
    let tappedPoint = sender.locationInView(self)
    let xCoordinate = tappedPoint.x;
    let yCoordinate = tappedPoint.y;
    settupLayer(CGPoint(x: xCoordinate, y: yCoordinate))
    delegate?.handleTouch(sender)
  }
  
  private func settupLayer(center: CGPoint) {
    // Particle layer
    for _ in 0..<numberOfParticle {
      self.layer.addSublayer(createCirle(center,
        radius: radius,
        size: size,
        color: colors[Int.random(0, max: colors.count - 1)],
        duration: duration))
    }
    
    // Big circle layer
    let layer = CAShapeLayer()
    let beginPath = UIBezierPath(arcCenter: center, radius: CGFloat(size * 0.2), startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
    
    let endPath = UIBezierPath(arcCenter: center, radius: CGFloat(size * 0.4), startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
    
    layer.path = beginPath.CGPath
    layer.fillColor = UIColor.clearColor().CGColor
    layer.strokeColor = UIColor(red:0.82, green:0.84, blue:0.83, alpha:1.0).CGColor
    layer.lineWidth = 1
    layer.masksToBounds = false
    
    let anim1 = CABasicAnimation(keyPath: "path")
    anim1.toValue = endPath.CGPath
    
    let anim2 = CABasicAnimation(keyPath: "opacity")
    anim2.toValue = 0
    
    
    let groupAnim = CAAnimationGroup()
    groupAnim.duration = duration
    groupAnim.animations = [anim1, anim2]
    groupAnim.removedOnCompletion = false
    groupAnim.fillMode = kCAFillModeForwards
    groupAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
    
    CATransaction.setCompletionBlock({
      layer.removeFromSuperlayer()
    })
    layer.addAnimation(groupAnim, forKey: nil)
    self.layer.addSublayer(layer)
  }
  
  private func createCirle(center: CGPoint, radius: Float, size: Float, color: UIColor, duration: Double) -> CAShapeLayer {
    let destinationX = Float(center.x) + Float.random(min: -size / 2, max: size / 2)
    let destinationY = Float(center.y) + Float.random(min: -size / 2, max: size / 2)
    
    let layer = CAShapeLayer()
    let radius = CGFloat(Float.random(min: radius * 0.8, max: radius * 1.2))
    let cirlePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
    
    layer.path = cirlePath.CGPath
    layer.fillColor = color.CGColor
    
    let anim1 = CABasicAnimation(keyPath: "position.x")
    anim1.toValue = destinationX
    
    let anim2 = CABasicAnimation(keyPath: "position.y")
    anim2.toValue = destinationY
    
    let anim3 = CABasicAnimation(keyPath: "transform.scale")
    anim3.toValue = 0.02
    
    let groupAnim = CAAnimationGroup()
    groupAnim.duration = duration
    groupAnim.animations = [anim1, anim2, anim3]
    groupAnim.removedOnCompletion = false
    groupAnim.fillMode = kCAFillModeForwards
    groupAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
    
    CATransaction.setCompletionBlock({
      layer.removeFromSuperlayer()
    })
    
    layer.addAnimation(groupAnim, forKey: nil)
    return layer
  }
  
}

//
//  ASRadialButton.swift
//  ASRadial
//
//  Created by Alper Senyurt on 1/5/15.
//  Copyright (c) 2015 alperSenyurt. All rights reserved.
//

import UIKit

protocol ASRadialButtonDelegate:class{
    
    func buttonDidFinishAnimation(radialButton : ASRadialButton)
}

class ASRadialButton: UIButton {
    
    weak var delegate:ASRadialButtonDelegate?
    var centerPoint:CGPoint!
    var bouncePoint:CGPoint!
    var originPoint:CGPoint!
    
    
    func willAppear () {
        
        
        self.imageView?.transform = CGAffineTransformRotate(CGAffineTransformIdentity, 180/180 * CGFloat(M_PI))
        self.alpha                = 1.0
        
        UIView.animateWithDuration(0.25, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.center               = self.bouncePoint
            self.imageView?.transform = CGAffineTransformRotate(CGAffineTransformIdentity, 0/180 * CGFloat(M_PI))
            }) { (finished:Bool) -> Void in
                UIView.animateWithDuration(0.15, animations: { () -> Void in
                    self.center = self.centerPoint
                })
        }
        
    }
    
    func willDisappear () {
        
        UIView.animateWithDuration(0.15, delay: 0.0, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            if let imageView = self.imageView {
                imageView.transform = CGAffineTransformRotate(CGAffineTransformIdentity, -180/180 * CGFloat(M_PI))
            }
            
            })  { (finished:Bool) -> Void in
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    self.center = self.originPoint
                    }, completion: { (finished) -> Void in
                        self.alpha = 0
                        self.delegate?.buttonDidFinishAnimation(self)
                })        }
        
        
    }
}

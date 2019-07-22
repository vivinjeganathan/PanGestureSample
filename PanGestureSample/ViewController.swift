//
//  ViewController.swift
//  PanGestureSample
//
//  Created by Jeganathan, Vivin on 7/21/19.
//  Copyright © 2019 Jeganathan, Vivin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var trashImageView: UIImageView!
    
    var initialPoint : CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialPoint = iconImageView.frame.origin
    }

    @IBAction func didPanImage(sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: view)
        
        switch sender.state {
        case .began, .changed:
            iconImageView.center = CGPoint(x: iconImageView.center.x + translation.x, y: iconImageView.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: view)
        case .ended:
            if iconImageView.frame.intersects(trashImageView.frame) {
                UIView.animate(withDuration: 0.3) {
                    self.iconImageView.alpha = 0.0
                }
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.iconImageView.frame.origin = self.initialPoint
                }
            }
        default:
            break
        }
    }
}


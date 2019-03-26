//
//  CLRotateAnimationSwiftController.swift
//  CLDemo
//
//  Created by AUG on 2019/3/21.
//  Copyright © 2019年 JmoVxia. All rights reserved.
//

import UIKit

class CLRotateAnimationSwiftController: CLBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let rotateAnimationView: CLRotateAnimationView = CLRotateAnimationView(frame: CGRect(x: 120, y: 120, width: 80, height: 80));
        rotateAnimationView.updateWithConfigure { (configure) -> (Void) in
            configure.backgroundColor = UIColor.orange;
            configure.number = 8;
            configure.duration = 4;
            configure.intervalDuration = 0.2;
        }
        rotateAnimationView.startAnimation()
        self.view.addSubview(rotateAnimationView)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            rotateAnimationView.pauseAnimation()
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            rotateAnimationView.resumeAnimation()
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
            rotateAnimationView.stopAnimation()
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 6) {
            rotateAnimationView.startAnimation()
        }

        let roundAnimationView = CLRoundAnimationView(frame: CGRect(x: 120, y: 320, width: 90, height: 90))
        roundAnimationView.updateWithConfigure { (configure) -> (Void) in
            configure.outBackgroundColor = UIColor(red:1.00, green:0.00, blue:0.01, alpha:0.60)
            configure.inBackgroundColor = UIColor(red:0.28, green:0.54, blue:0.96, alpha:1.00)
            configure.duration = 1
            configure.strokeStart = 0
            configure.strokeEnd = 0.3
            configure.inLineWidth = 30
            configure.outLineWidth = 20
            configure.position = .animationMiddle
        }
        view.addSubview(roundAnimationView)
        roundAnimationView.startAnimation()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            roundAnimationView.pauseAnimation()
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            roundAnimationView.resumeAnimation()
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
            roundAnimationView.stopAnimation()
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 6) {
            roundAnimationView.startAnimation()
        }
    }
}

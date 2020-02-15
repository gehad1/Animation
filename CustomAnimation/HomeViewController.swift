//
//  HomeViewController.swift
//  CustomAnimation
//
//  Created by Gehad on 2/13/20.
//  Copyright © 2020 macintosh. All rights reserved.
//

import UIKit
import IBAnimatable

class HomeViewController: UIViewController {

 
    @IBOutlet weak var tutorView: AnimatableView!
    @IBOutlet weak var whoLabel: UILabel!
    @IBOutlet weak var babySitterView: AnimatableView!
    @IBOutlet weak var discoveriesView: AnimatableView!
    @IBOutlet weak var babySitterLabel: UILabel!
    @IBOutlet weak var welcomLabel: UILabel!
    @IBOutlet weak var tutorLabel: UILabel!
    
    let info = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         animateView()
         animateWelcomeText()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    func animateWelcomeText(){
        let groupAnimation = CAAnimationGroup()
        groupAnimation.duration = 1.5
        groupAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        groupAnimation.fillMode = CAMediaTimingFillMode.backwards
        groupAnimation.beginTime = CACurrentMediaTime()
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = 1
        scaleAnimation.toValue = 0.5
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = CGFloat.pi + 5
        rotationAnimation.toValue  = 0.0
        
        let fadeAnimation = CABasicAnimation(keyPath: "opacity")
        fadeAnimation.fromValue = 1.0
        fadeAnimation.toValue  = 2.0
        
        groupAnimation.animations = [scaleAnimation,rotationAnimation   , fadeAnimation]
        welcomLabel.layer.add(groupAnimation, forKey: nil)
        
    }
    func animateView() {
        let flyRight = CABasicAnimation(keyPath: "position.x")
        flyRight.duration = 2
        flyRight.fromValue = -view.bounds.size.width
        flyRight.toValue = view.bounds.minX + 100
//        flyRight.toValue = view.frame.size.width / 4.5
        flyRight.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        flyRight.fillMode = CAMediaTimingFillMode.backwards
        flyRight.speed = 0.75
        flyRight.beginTime = CACurrentMediaTime() + 0.3
        flyRight.beginTime = CACurrentMediaTime() + 0.6
        flyRight.delegate = self
        flyRight.setValue("form", forKey: "name")
        flyRight.setValue(tutorView.layer, forKey: "layer")
        tutorView.layer.add(flyRight, forKey: nil)
        flyRight.setValue(babySitterView.layer, forKey: "layer")
        babySitterView.layer.add(flyRight, forKey: nil)
        flyRight.setValue(discoveriesView.layer, forKey: "layer")
        discoveriesView.layer.add(flyRight, forKey: nil)
     
    }
    func animatePressedLabel(view: UIView ,completion : @escaping ()->()) {
        let flyTop = CABasicAnimation(keyPath: "position")
        flyTop.duration = 1.5
        flyTop.fromValue = [50,0]
        let point = welcomLabel.bounds.origin
        flyTop.toValue = [20,-175]
        flyTop.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
        flyTop.fillMode = CAMediaTimingFillMode.removed
        view.layer.add(flyTop, forKey: nil)
        completion()
    }

    @IBAction func tutorButtonTapped(_ sender: Any) {
        animatePressedLabel(view: tutorLabel, completion: {
            self.welcomLabel.text = "Tutor"
        })
//        let viewcontroller =  storyboard?.instantiateViewController(withIdentifier: "FocusViewController") as! FocusViewController
//        let transition = CATransition.init()
//        transition.duration = 0.25
//        transition.timingFunction = CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.linear)
//        transition.type = CATransitionType.fade
//         transition.fillMode = CAMediaTimingFillMode.both
//        transition.delegate = self as? CAAnimationDelegate
//        view.window!.layer.add(transition, forKey: kCATransition)
//        self.navigationController?.pushViewController(viewcontroller, animated: false)
    }
    
    @IBAction func babySitterTapped(_ sender: Any) {
        animatePressedLabel(view: babySitterLabel, completion: {
            self.welcomLabel.text = "Tutor"
        })
    }
    
}
extension HomeViewController : CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        guard let name = anim.value(forKey: "name")   as? String, let layer = anim.value(forKey: "layer") as? CALayer  else {
            return
        }
        if name == "form" {
            let pulse = CABasicAnimation(keyPath: "transform.scale")
            pulse.fromValue = 1.0
            pulse.toValue = 0.5
            pulse.duration = 1
            layer.add(pulse, forKey: nil)
        }
    }
}
extension UIView {
    func animateTo(frame: CGRect, withDuration duration: TimeInterval, completion: ((Bool) -> Void)? = nil) {
        guard let _ = superview else {
            return
        }
        let xScale = frame.size.width
        let yScale = frame.size.height
        let x = frame.origin.x
        let y = frame.origin.y
        UIView.animate(withDuration: duration, delay: 0, options: .curveLinear, animations: {
            self.layer.position = CGPoint(x: x, y: y)
            self.transform = self.transform.translatedBy(x: xScale, y: yScale)
        }, completion: completion)
    }
}

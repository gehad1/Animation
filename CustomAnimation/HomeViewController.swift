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

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         animateView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
    }
    func animateView() {
        let flyRight = CABasicAnimation(keyPath: "position.x")
        flyRight.duration = 1
        flyRight.fromValue = -view.bounds.size.width / 2
        flyRight.toValue = view.bounds.size.width / 4
        flyRight.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        flyRight.fillMode = CAMediaTimingFillMode.backwards
        tutorView.layer.add(flyRight, forKey: nil)
        flyRight.beginTime = CACurrentMediaTime() + 0.4
        babySitterView.layer.add(flyRight, forKey: nil)
        flyRight.beginTime = CACurrentMediaTime() + 0.8
        discoveriesView.layer.add(flyRight, forKey: nil)
    }
    func animatePressedLabel(view: UIView ,completion : @escaping ()->()) {
        let flyTop = CABasicAnimation(keyPath: "position")
        flyTop.duration = 1
        flyTop.fromValue = [50,0]
        flyTop.toValue = [20,-175]
        flyTop.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
        flyTop.fillMode = CAMediaTimingFillMode.removed
        view.layer.add(flyTop, forKey: nil)
        completion()

    }
    
//    func animateInfo() {
//        info.frame = CGRect(x: 0.0, y: whoLabel.center.y + 30, width: view.frame.size.width, height: 30)
//        view.insertSubview(info, belowSubview: whoLabel)
//    }

    @IBAction func tutorButtonTapped(_ sender: Any) {
        animatePressedLabel(view: tutorLabel, completion: {
            self.welcomLabel.text = "Tutor"
        })
       // tutorLabel.animateTo(frame: self.tutorLabel.frame, withDuration: 1)
        
//        let viewcontroller =  storyboard?.instantiateViewController(withIdentifier: "FocusViewController") as! FocusViewController
//       self.navigationController?.pushViewController(viewcontroller, animated: true)
    }
    
    @IBAction func babySitterTapped(_ sender: Any) {
        animatePressedLabel(view: babySitterLabel, completion: {
            self.welcomLabel.text = "Tutor"
        })
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

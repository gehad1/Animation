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
    
    @IBOutlet weak var tutorLabel: UILabel!
    let info = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         animateFrom()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
    }
    func animateFrom() {
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
    func animateFrom2() {
        let flyTop = CABasicAnimation(keyPath: "position.y")
        flyTop.duration = 3
        flyTop.fromValue = [0,0]
        flyTop.toValue = 
        flyTop.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        flyTop.fillMode = CAMediaTimingFillMode.backwards
        tutorLabel.layer.add(flyTop, forKey: nil)
//        flyTop.beginTime = CACurrentMediaTime() + 0.4
//        babySitterView.layer.add(flyTop, forKey: nil)
//        flyTop.beginTime = CACurrentMediaTime() + 0.8
//        discoveriesView.layer.add(flyTop, forKey: nil)
    }
    
//    func animateInfo() {
//        info.frame = CGRect(x: 0.0, y: whoLabel.center.y + 30, width: view.frame.size.width, height: 30)
//        view.insertSubview(info, belowSubview: whoLabel)
//    }

    @IBAction func tutorButtonTapped(_ sender: Any) {
//       animateFrom2()
        let viewcontroller =  storyboard?.instantiateViewController(withIdentifier: "FocusViewController") as! FocusViewController
       self.navigationController?.pushViewController(viewcontroller, animated: true)
    }
    
}

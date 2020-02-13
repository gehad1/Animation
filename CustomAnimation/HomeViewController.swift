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
    
    let info = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateFrom()
    }
    func animateFrom() {
        // TODO: add your frist layer animation
        let flyRight = CABasicAnimation(keyPath: "position.x")
        flyRight.duration = 1
        flyRight.fromValue = -view.bounds.size.width / 2
        flyRight.toValue = view.bounds.size.width / 4 + 4
        tutorView.layer.add(flyRight, forKey: nil)
        babySitterView.layer.add(flyRight, forKey: nil)
        discoveriesView.layer.add(flyRight, forKey: nil)
    }
    
//    func animateInfo() {
//        info.frame = CGRect(x: 0.0, y: whoLabel.center.y + 30, width: view.frame.size.width, height: 30)
//        view.insertSubview(info, belowSubview: whoLabel)
//    }

    @IBAction func tutorButtonTapped(_ sender: Any) {
    }
    
}

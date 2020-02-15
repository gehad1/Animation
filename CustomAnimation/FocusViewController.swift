//
//  FocusViewController.swift
//  CustomAnimation
//
//  Created by Gehad on 2/14/20.
//  Copyright © 2020 macintosh. All rights reserved.
//

import UIKit

class FocusViewController: UIViewController,CAAnimationDelegate {

    @IBOutlet weak var flyingLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.transition(with: flyingLabel,
                          duration: 1,
                          options: .curveEaseIn,
                          animations: { [weak self] in
                            self?.flyingLabel.text = "gehad"
            }, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        animatePressedLabel(view: flyingLabel, completion: {
//
//        })
    }
    func animatePressedLabel(view: UIView ,completion : @escaping ()->()) {
        let flyTop = CABasicAnimation(keyPath: "position")
        flyTop.duration = 1.5
        flyTop.fromValue = [0,0]
        flyTop.toValue = [1000,-1000]
        flyTop.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
        flyTop.fillMode = CAMediaTimingFillMode.removed
        view.layer.add(flyTop, forKey: nil)
        completion()
    }

}

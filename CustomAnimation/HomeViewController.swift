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
    
    @IBOutlet weak var babySitterView: AnimatableView!
    
    @IBOutlet weak var discoveriesView: AnimatableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tutorButtonTapped(_ sender: Any) {
    }
    
}

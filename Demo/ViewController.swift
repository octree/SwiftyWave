//
//  ViewController.swift
//  Demo
//
//  Created by Octree on 2018/9/10.
//  Copyright © 2018年 Octree. All rights reserved.
//

import UIKit
import SwiftyWave

class ViewController: UIViewController {

    @IBOutlet weak var waveView: SwiftyWaveView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func start(_ sender: Any) {
        
        waveView.start()
    }
    
    @IBAction func stop(_ sender: Any) {
        
        waveView.stop()
    }
}


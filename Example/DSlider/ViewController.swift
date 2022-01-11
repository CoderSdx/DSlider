//
//  ViewController.swift
//  DSlider
//
//  Created by dexiong on 01/11/2022.
//  Copyright (c) 2022 dexiong. All rights reserved.
//

import UIKit
import DSlider

class ViewController: UIViewController {
    
    lazy var slider1: DSlider = {
        let slider: DSlider = .init(.default)
        slider.delegate = self
        return slider
    }()
    
    lazy var slider2: DSlider = {
        let slider: DSlider = .init(.marks)
        slider.marks = 0
        slider.delegate = self
        return slider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(slider1)
        view.addSubview(slider2)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        slider1.frame = .init(x: 20, y: 100, width: UIScreen.main.bounds.width - 40, height: 40)
        slider2.frame = .init(x: 20, y: 200, width: UIScreen.main.bounds.width - 40, height: 40)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController : DSliderDelegate {
    func slider(_ slider: DSlider, value: Float) {
        print(value)
    }
}

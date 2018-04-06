//
//  ViewController.swift
//  Gestures4
//
//  Created by Ivan Aldama on 03/04/18.
//  Copyright © 2018 Ivan Aldama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setViews()
    }

    //Objects
    let banana:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "banana")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isUserInteractionEnabled = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let androidd:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "android")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isUserInteractionEnabled = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
   let background:UIView = {
    let view:UIView = UIView(frame: UIScreen.main.bounds)
    view.frame.size.height = 0
    view.backgroundColor = UIColor.clear
    return view
    }()
    
    func setViews() {
        //adding Subviews
        view.addSubview(banana)
        view.addSubview(androidd)
        view.addSubview(background)
        
        //Creating Gesture recognizer
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAnimation(_:)))
        //Adding gesture to object banana(image)
        banana.addGestureRecognizer(swipe)
        
        banana.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        banana.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        banana.heightAnchor.constraint(equalToConstant: 250).isActive = true
        banana.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        androidd.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        androidd.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        androidd.heightAnchor.constraint(equalToConstant: 250).isActive = true
        androidd.widthAnchor.constraint(equalToConstant: 250).isActive = true
    
    }
    
    @objc func swipeAnimation(_ sender:UITapGestureRecognizer) {
        print("swiping")
        
        UIView.animate(withDuration: 0.5, delay: 0.2, options: [], animations: {
            self.view.bringSubview(toFront: self.banana)
        }, completion: {_ in
            //self.view.bringSubview(toFront: self.banana)
            UIView.animate(withDuration: 1, animations: {
                self.banana.frame.size.width = self.view.frame.width
                self.banana.frame.size.height = self.view.bounds.height * 0.2
                self.banana.center = self.view.center
                self.banana.backgroundColor = UIColor.black
                
                self.background.backgroundColor = UIColor.cyan
                self.background.frame.size.height = self.view.frame.height
            }, completion: nil)
            })
    }
}


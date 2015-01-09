//
//  ViewController.swift
//  ASRadial
//
//  Created by Alper Senyurt on 1/5/15.
//  Copyright (c) 2015 alperSenyurt. All rights reserved.
//

import UIKit

class ViewController: UIViewController,ASRadialMenuDelegate{

    var radialMenu:ASRadialMenu!
    @IBOutlet weak var button: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.radialMenu = ASRadialMenu()
        self.radialMenu.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        
        self.radialMenu.buttonsWillAnimateFromButton(sender as UIButton, frame: self.button.frame, view: self.view)
        
    }
    
    func numberOfItemsInRadialMenu (radialMenu:ASRadialMenu)->NSInteger {
        
        return 6
    }
    func arcSizeInRadialMenu (radialMenu:ASRadialMenu)->NSInteger {
        
        return 360
    }
    func arcRadiousForRadialMenu (radialMenu:ASRadialMenu)->NSInteger {
        
        return 80
    }
    func radialMenubuttonForIndex(radialMenu:ASRadialMenu,index:NSInteger)->ASRadialButton {
        
        let button:ASRadialButton = ASRadialButton()
        
        if index == 1 {
            
            button.setImage(UIImage(named: "HowToPlay"), forState:.Normal)
            
        } else if index == 2 {
            
            button.setImage(UIImage(named: "Invite"), forState:.Normal)
            
        } else if index == 3 {
            
            button.setImage(UIImage(named: "Leader"), forState:.Normal)
        }
        if index == 4 {
            
            button.setImage(UIImage(named: "Mail"), forState:.Normal)
            
        } else if index == 5 {
            
            button.setImage(UIImage(named: "Shop"), forState:.Normal)
            
        } else if index == 6 {
            
            button.setImage(UIImage(named: "Sound"), forState:.Normal)
        }
        
        return button
    }
    
    func radialMenudidSelectItemAtIndex(radialMenu:ASRadialMenu,index:NSInteger) {
        
        self.radialMenu.itemsWillDisapearIntoButton(self.button)
        
    }
    

}


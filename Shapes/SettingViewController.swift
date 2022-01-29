//
//  SettingViewController.swift
//  Shapes
//
//  Created by Lukas Koppelmann on 29.01.22.
//  Copyright © 2022 Ray Wenderlich. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  func  loadInt(desName: String) -> Int{
      let defaults = UserDefaults.standard
      if let savedValue = defaults.object(forKey: desName) as? Int{
          print("Loaded '\(savedValue)'")
          return savedValue
      }
      return 0
  }
  
  func saveInt(nameSafe: Int, desName: String){
      let saveValue = nameSafe
      let defaults = UserDefaults.standard
      defaults.set(saveValue, forKey: desName)
      print("Saved '\(saveValue)'")
    }
  }

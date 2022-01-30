//
//  SettingViewController.swift
//  Shapes
//
//  Created by Lukas Koppelmann on 29.01.22.
//  Copyright © 2022 Ray Wenderlich. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
  var soundSetting = 1;
  //-----
  override func viewDidLoad() {
      super.viewDidLoad()
     let soundSetting = loadInt(desName: "soundOn")
      if soundSetting == 1{
          soundSwitcher.setOn(true, animated: false)
          soundSwitcher.isOn = true
      }else{
          soundSwitcher.setOn(false, animated: false)
          soundSwitcher.isOn = false
      }

      // Do any additional setup after loading the view.
  }
  @IBOutlet weak var soundSwitcher: UISwitch!
  @IBAction func soundSwitch(_ sender: Any) {
      if soundSwitcher.isOn{
          soundSetting = 1;
          saveInt(nameSafe: soundSetting, desName: "soundOn")
      }else{
          soundSetting = 0;
          saveInt(nameSafe: soundSetting, desName: "soundOn")
      }
      print(soundSetting);
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
  @IBAction func resetButton(_ sender: Any) {
    saveInt(nameSafe: 0, desName: "coins")
    saveInt(nameSafe: 0, desName: "highScoreSaved")
    saveInt(nameSafe: 0, desName: "isAlive")
    saveInt(nameSafe: 0, desName: "currentSkin")
    saveInt(nameSafe: 0, desName: "itemOneUnlocked")
    saveInt(nameSafe: 0, desName: "itemTwoUnlocked")
  }
}

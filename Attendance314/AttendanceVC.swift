//
//  ViewController.swift
//  Attendance314
//
//  Created by Araav Nayak on 3/7/24.
//

import UIKit
import SwiftUI

class AttendanceVC: UIViewController {
    

    @IBOutlet var buttons: [UIButton]!
    var buttonTexts: [String] = []
    var presentColor: UIColor = UIColor(red: 2/255, green: 101/255, blue: 17/255, alpha: 1)
    var absentColor: UIColor = .red
    var defaultColor : UIColor = UIColor.tintColor
    @IBOutlet weak var showSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Additional setup
        
    }
    
    
    @objc func buttonTapped(_ sender: UIButton) {
        print("3")
        if sender.tintColor != presentColor {
            print("1")
            sender.tintColor = presentColor
        } else {
            print("2")
            sender.tintColor = absentColor
        }
        
        //}
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showSwitch.setOn(false, animated: true)
        if let buttons = buttons {
            for button in buttons {
                print("Here is the text: \(button.titleLabel?.text ?? "no??")")
                
                if let text = button.titleLabel?.text {
                    print("hi")
                    buttonTexts.append(text)
                } else {
                    print("bye")
                }
                
                
                //buttonTexts.append(String("" + (button.titleLabel?.text)!))
                button.setTitle("", for: .normal)
                button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            }
        }
        
        let addVC = ViewController() // Instantiate the view controller you want to present

        // Present the attendanceVC from the current view controller
        self.present(addVC, animated: true, completion: nil)
    }
    
    
    
    @IBAction func showInitialsToggled(_ sender: UISwitch) {
        if sender.isOn {
            var count = 0
            for button in buttons {
                button.setTitle(buttonTexts[count], for: .normal)
                count = count + 1
            }
        } else {
            for button in buttons {
                button.setTitle("", for: .normal)
            }
        }
    }
    
    
}


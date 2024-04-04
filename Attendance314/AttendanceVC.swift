//
//  ViewController.swift
//  Attendance314
//
//  Created by Araav Nayak on 3/7/24.
//

import UIKit
import SwiftUI
import CoreData

class AttendanceVC: UIViewController, NSFetchedResultsControllerDelegate {
    
    //Note to self:
    //Three things left to do
    //- get class roster for other classes and display that
    //- add edit functionality (and save using coredata?)
    //-
    
    //add gesture recognizer when editable that gives option to remove student
    
    
    @IBOutlet var buttons: [UIButton]!
    var p2: [Student] = [] //populate later
    var p3: [Student] = []
    var p4: [Student] = []
    var p5: [Student] = [] //populate later
    var currentPeriod: [Student] = []
    var currentPeriodNum = 3
    //var currentPeriod = "P3"
    @IBOutlet weak var periodChooser: UIButton!
    var presentColor: UIColor = UIColor(red: 2/255, green: 101/255, blue: 17/255, alpha: 1)
    var absentColor: UIColor = .red
    var defaultColor : UIColor = UIColor.tintColor
    @IBOutlet weak var showSwitch: UISwitch!
    @IBOutlet weak var showSwitchText: UILabel!
    @IBOutlet weak var darkModeSwitchText: UILabel!
    var markEveryonePresentCounter = 0
    var settingsBtnClicks = 0
    var editable = false
    
    var frc : NSFetchedResultsController<StudentMO>!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //updateArray(periodNum: currentPeriodNum)
        // Additional setup
        //setButtonLabels()
        setPopupButton()
        setUpLongPressGesture()
        
        
        let fR : NSFetchRequest<StudentMO> = StudentMO.fetchRequest()
        let sD = NSSortDescriptor(key: "num", ascending: true)
        fR.sortDescriptors = [sD]
        
        if let myAppDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            let context = myAppDelegate.persistentContainer.viewContext
            frc = NSFetchedResultsController(fetchRequest: fR, managedObjectContext:
                                                context, sectionNameKeyPath: nil, cacheName: nil)
            frc.delegate = self
            do {
                try frc.performFetch()
                
                if let fetchedObjects = frc.fetchedObjects {
                    //p3 = fetchedObjects
                    //MyStateItems = fetchedObjects //how to fix this
                    //print(MyStateItems)
                }
            } catch {
                print(error)
            }
            if p3.count == 0 {
                let seedStudents = [
                    Student(initials: "DC", name: "Dipesh Chettri", num: 0),
                    Student(initials: "AZ", name: "Andy Zhang", num: 1),
                    Student(initials: "RA", name: "Ragavan Arivazhagan", num: 2),
                    Student(initials: "JS", name: "Jerry Song", num: 3),
                    Student(initials: "AS", name: "Aditya Sarin", num: 4),
                    Student(initials: "RC", name: "Richard Chan", num: 5),
                    Student(initials: "AS", name: "Annie Shang", num: 6),
                    Student(initials: " ", name: " ", num: 7),
                    Student(initials: "LW", name: "Luna Wang", num: 8),
                    Student(initials: "EF", name: "Elisabeth Flores", num: 9),
                    Student(initials: "RS", name: "Rohil Shah", num: 10),
                    Student(initials: "SA", name: "Sravya Annambhotla", num: 11),
                    Student(initials: "CH", name: "Christopher Hart", num: 12),
                    Student(initials: " ", name: " ", num: 13),
                    Student(initials: "IK", name: "Ian Kim", num: 14),
                    Student(initials: " ", name: " ", num: 15),
                    Student(initials: "GT", name: "Gautam Taneja", num: 16),
                    Student(initials: " ", name: " ", num: 17),
                    Student(initials: "AA", name: "Aarush Arya", num: 18),
                    Student(initials: "AL", name: "Alison Liu", num: 19),
                    Student(initials: "ZC", name: "Zoe Cai", num: 20),
                    Student(initials: "VT", name: "Varchas Thaker", num: 21),
                    Student(initials: "MG", name: "Marcely Guilmineau", num: 22),
                    Student(initials: " ", name: " ", num: 23),
                    Student(initials: "TW", name: "Tiffany Wang", num: 24),
                    Student(initials: "NB", name: "Noel Bobby", num: 25),
                    Student(initials: "AT", name: "Avi Tomar", num: 26),
                    Student(initials: "RU", name: "Reva Ukkadam", num: 27),
                    Student(initials: "TB", name: "Tejas Bonapati", num: 28),
                    Student(initials: " ", name: " ", num: 29),
                    Student(initials: "CZ", name: "Christopher Zhang", num: 30),
                    Student(initials: "AS", name: "Aditya Suresh", num: 31),
                    Student(initials: "AM", name: "Anushree Misra", num: 32),
                    Student(initials: "AP", name: "Arushi Pasad", num: 33),
                    Student(initials: " ", name: " ", num: 34),
                    Student(initials: " ", name: " ", num: 35)
                ]
                
                for item in seedStudents {
                    p3.append(item)
                    let addItemMO = StudentMO(context: context)
                    addItemMO.initials = item.initials
                    addItemMO.name = item.name
                    addItemMO.num = Int16(item.num)
                    myAppDelegate.saveContext()
                }
            }
            
            if p2.count == 0 {
                let seedStudents = [
                    Student(initials: "KR", name: "Kavin Raghuveer", num: 0),
                    Student(initials: "RM", name: "Rhiann Mai", num: 1),
                    Student(initials: "AC", name: "Abhinab Chatterjee", num: 2),
                    Student(initials: "AS", name: "Arya Srinivasan", num: 3),
                    Student(initials: "NG", name: "Namita Gaidhani", num: 4),
                    Student(initials: "MF", name: "Maple Fan", num: 5),
                    Student(initials: "DL", name: "Donggyu Lee", num: 6),
                    Student(initials: "AK", name: "Akhil Krishnan", num: 7),
                    Student(initials: "LC", name: "Lawrence Chen", num: 8),
                    Student(initials: "PS", name: "Pragya Sharma", num: 9),
                    Student(initials: "LL", name: "Lydia Lei", num: 10),
                    Student(initials: "DY", name: "Dohyun Yang", num: 11),
                    Student(initials: "KG", name: "Kavya Gupta", num: 12),
                    Student(initials: "AA", name: "Ashaaz Ahmed", num: 13),
                    Student(initials: "VBA", name: "Vismay Bhargav Achar", num: 14),
                    Student(initials: "AK", name: "Aashvik Kohli", num: 15),
                    Student(initials: "OD", name: "Olivia Duan", num: 16),
                    Student(initials: "AB", name: "Ayush Bheemaiah", num: 17),
                    Student(initials: "AS", name: "Ayaan Sayed", num: 18),
                    Student(initials: "AZ", name: "Albert Zhang", num: 19),
                    Student(initials: "DP", name: "Devansh Patil", num: 20),
                    Student(initials: "NH", name: "Nathan Han", num: 21),
                    Student(initials: " ", name: " ", num: 22),
                    Student(initials: "GP", name: "Gavin Phan", num: 23),
                    Student(initials: "LN", name: "Lan Nguyen", num: 24),
                    Student(initials: "JA", name: "Jaseer Abdulla", num: 25),
                    Student(initials: "LT", name: "Luke Tian", num: 26),
                    Student(initials: "SS", name: "Sahana Sudireddi", num: 27),
                    Student(initials: "AT", name: "Aidan Tian", num: 28),
                    Student(initials: "BS", name: "Bhargav Subramanian", num: 29),
                    Student(initials: " ", name: " ", num: 30),
                    Student(initials: " ", name: " ", num: 31),
                    Student(initials: " ", name: " ", num: 32),
                    Student(initials: " ", name: " ", num: 33),
                    Student(initials: " ", name: " ", num: 34),
                    Student(initials: " ", name: " ", num: 35)
                ]
                for item in seedStudents {
                    p2.append(item)
                    let addItemMO = StudentMO(context: context)
                    addItemMO.initials = item.initials
                    addItemMO.name = item.name
                    addItemMO.num = Int16(item.num)
                    myAppDelegate.saveContext()
                }
            }
            
            if p5.count == 0 {
                let seedStudents = [
                    Student(initials: " ", name: " ", num: 0),
                    Student(initials: "VH", name: "Vismay Harish", num: 1),
                    Student(initials: "SP", name: "Shlok Pilare", num: 2),
                    Student(initials: " ", name: " ", num: 3),
                    Student(initials: "SP", name: "Sharvil Phadke", num: 4),
                    Student(initials: "WC", name: "Wesley Compton", num: 5),
                    Student(initials: "AT", name: "Anish Tavare", num: 6),
                    Student(initials: "MF", name: "Mohamed Firdousi", num: 7),
                    Student(initials: "NL", name: "Nancy Lim", num: 8),
                    Student(initials: "AN", name: "Adhwita Nair", num: 9),
                    Student(initials: "MN", name: "Mitali Nair", num: 10),
                    Student(initials: "AM", name: "Anwitha Muddireddy", num: 11),
                    Student(initials: "AP", name: "Aayush Palai", num: 12),
                    Student(initials: "KC", name: "Kyle Chian", num: 13),
                    Student(initials: "YH", name: "Yuke Hase", num: 14),
                    Student(initials: "SL", name: "Stephen Lin", num: 15),
                    Student(initials: "MK", name: "Minchan Kwon (Andrew)", num: 16),
                    Student(initials: " ", name: " ", num: 17),
                    Student(initials: "SJ", name: "Sriram Jupalle", num: 18),
                    Student(initials: " ", name: " ", num: 19),
                    Student(initials: "LG", name: "Lucas Guthrie", num: 20),
                    Student(initials: "TJ", name: "Tvisha Jain", num: 21),
                    Student(initials: " ", name: " ", num: 22),
                    Student(initials: "ML", name: "Marcus Lau", num: 23),
                    Student(initials: "EH", name: "Ella He", num: 24),
                    Student(initials: "DR", name: "David Ryu", num: 25),
                    Student(initials: "RG", name: "Rowan Gutierrez", num: 26),
                    Student(initials: "HL", name: "Hanjoon Lee", num: 27),
                    Student(initials: "MM", name: "Macer Monte (Rex)", num: 28),
                    Student(initials: "TT", name: "Toshiki Takeuchi", num: 29),
                    Student(initials: "DJ", name: "Dhruva Jogleisar", num: 30),
                    Student(initials: "CS", name: "Clare Shen", num: 31),
                    Student(initials: "SR", name: "Shourya Rajput", num: 32),
                    Student(initials: "MY", name: "Minwoo Yu", num: 33),
                    Student(initials: "JM", name: "Jerry Ma", num: 34),
                    Student(initials: "BK", name: "Bolveys Klimanis", num: 35)
                ]
                
                for item in seedStudents {
                    p5.append(item)
                    let addItemMO = StudentMO(context: context)
                    addItemMO.initials = item.initials
                    addItemMO.name = item.name
                    addItemMO.num = Int16(item.num)
                    myAppDelegate.saveContext()
                }
                
            }
                
            
            
        } //app delegate
        
        
        
    }
    
    
    func updateArray(periodNum: Int) {
        if periodNum == 3 {
            currentPeriod = p3
        } else if periodNum == 2 {
            currentPeriod = p2
        } else if periodNum == 5 {
            currentPeriod = p5
        } //else if periodNum == 7 {
        //currentPeriod = p7
        //}
        print("Start!")
        if let buttons = buttons {
            print("Buttons: \(buttons.count) + and initials: \(currentPeriod.count)")
            for i in 0..<buttons.count {
                //buttons[i].titleLabel?.text = currentPeriod[i].initials
                buttons[i].setTitle("", for: .normal)
                buttons[i].tintColor = defaultColor
                
                //print("buttons has \(buttons[i].titleLabel?.text) and array stores \(currentPeriod[i].initials)")
            }
            showSwitch.isOn = false
        }
        print("Done!")
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
//        let addItem = {(action: UIAction) in
//            print(action.title)
//            //A HANDLER that uses coredata/frc to save the inputted name...will save the name entered as an attribute AND ALSO find the initials using an algorithm
//            //NOTE: needs reference to typed text (tf)
//            var str = action.title
//            let secondCharacter = str[str.index(str.startIndex, offsetBy: 1)]
//            if let secondCharacterInt = Int(String(secondCharacter)) {
//                self.currentPeriodNum = secondCharacterInt
//            }
//        
//            //self.currentPeriodNum = Int(str[str.index(str.startIndex, offsetBy: 1)])!
//            self.updateArray(periodNum: self.currentPeriodNum)
//            //self.setButtonLabels()
//        }
        
        //print("3")
        if !editable {
            if sender.tintColor != presentColor {
                //print("1")
                sender.tintColor = presentColor
            } else {
                //print("2")
                sender.tintColor = absentColor
            }
        } else {
            
            //show pop up dialog
//            let alertView = UIAlertController(title: "Placeholder!", message: "", preferredStyle: .alert)
//            alertView.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            self.present(alertView, animated: true, completion: nil)
            //tricky part is to map a button from buttons to a name from the current array not given the index --> find it
            var idx = buttons.firstIndex(of: sender)
            var name = currentPeriod[idx!].name
            
            let alert = UIAlertController(title: "Edit seat data", message: "\(name) - \((sender.titleLabel?.text)!)", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: nil)) //NEEDS A HANDLER that uses coredata/frc to save the inputted name...will save the name entered as an attribute AND ALSO find the initials using an algorithm
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
            
            alert.addTextField(configurationHandler: {(textField: UITextField!) in
                textField.placeholder = "Enter the new name:"
                textField.isSecureTextEntry = false // for password input
            })
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        for button in buttons {
            button.titleLabel?.text = " "
            
        }
        updateArray(periodNum: currentPeriodNum)
        showSwitch.setOn(false, animated: true)
        
        setUpLongPressGesture()
        
        let addVC = ViewController()
        self.present(addVC, animated: true, completion: nil)
    }
    
    @objc func handleLongPress(_ gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .began {
            // Handle the long press gesture
            print("Long press detected.")
            // Add your code here to perform actions when long press is detected
        }
    }
    
    func setUpLongPressGesture() {
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        longPressRecognizer.minimumPressDuration = 0.5 // 0.5 seconds
        for button in buttons {
            button.addGestureRecognizer(longPressRecognizer)
        }
    }
    
    func setPopupButton() {
        let popupClosure = {(action: UIAction) in
            print(action.title)
            var str = action.title
            let secondCharacter = str[str.index(str.startIndex, offsetBy: 1)]
            if let secondCharacterInt = Int(String(secondCharacter)) {
                self.currentPeriodNum = secondCharacterInt
            }
        
            //self.currentPeriodNum = Int(str[str.index(str.startIndex, offsetBy: 1)])!
            self.updateArray(periodNum: self.currentPeriodNum)
            //self.setButtonLabels()
        }
        
        periodChooser.menu = UIMenu(children: [
            UIAction(title: "P2", handler: popupClosure),
            UIAction(title: "P3", state: .on, handler: popupClosure),
            UIAction(title: "P5", handler: popupClosure)])
        
        periodChooser.showsMenuAsPrimaryAction = true
        periodChooser.changesSelectionAsPrimaryAction = true
    }
    
    @IBAction func showInitialsToggled(_ sender: UISwitch) {
        if sender.isOn {
            
           
            var count = 0
            for button in buttons {
                print("length" + String(currentPeriod.count) + " cureently: " + String(count))
                button.setTitle(currentPeriod[count].initials, for: .normal)
                count = count + 1
            }
        } else {
            for button in buttons {
                button.setTitle("", for: .normal)
            }
        }
    }
    
    @IBAction func darkModeToggled(_ sender: UISwitch) {
        if sender.isOn {
            view.backgroundColor = .black
            showSwitchText.textColor = .white
            darkModeSwitchText.textColor = .white
            periodChooser.titleLabel?.textColor = .white
            for button in buttons {
                button.setTitleColor(.white, for: .normal)
            }
            
        } else {
            view.backgroundColor = .white
            showSwitchText.textColor = .black
            darkModeSwitchText.textColor = .black
            periodChooser.titleLabel?.textColor = .black
            for button in buttons {
                button.setTitleColor(.white, for: .normal)
            }
        }
    }
    
   
    
    @IBAction func markEveryonePresentToggled(_ sender: Any) {
        markEveryonePresentCounter += 1
        
        if markEveryonePresentCounter % 2 == 1 {
            for button in buttons {
                button.tintColor = presentColor
            }
        } else {
            for button in buttons {
                button.tintColor = defaultColor
            }
        }
    }
    
    
    @IBAction func copyBtnClicked(_ sender: Any) {
        //generate an alert, and copy the data
        copyData()
        
        let alertView = UIAlertController(title: "Copy success!", message: "", preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertView, animated: true, completion: nil)
        
    }
    
    func copyData() {
        var absentStudents: [String] = []
        for button in buttons {
            if button.tintColor == absentColor {
                //print(button.titleLabel?.text!)
                var idx = buttons.index(of: button)
                absentStudents.append(currentPeriod[idx!].name)
                //absentStudents.append((button.titleLabel?.text!)!) //should append the  name of the item not the initials on the button
            }
        }
        let pasteboard = UIPasteboard.general
        pasteboard.string = "Absent: " + absentStudents.description
    }
    
    
    @IBAction func settingsBtnToggled(_ sender: UIButton) {
        var iable = sender.currentImage
        print(iable)
        
        settingsBtnClicks += 1
        if settingsBtnClicks % 2 == 1 {
            sender.setImage(.checkmark, for: .normal)
            editable = true
        } else {
            sender.setImage(UIImage.init(systemName: "gearshape.fill"), for: .normal)
            editable = false
        }
        
        
        
    }
    
    
}

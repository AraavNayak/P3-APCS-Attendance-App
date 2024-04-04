////
////  ViewController.swift
////  Attendance314
////
////  Created by Araav Nayak on 3/7/24.
////
//
//import UIKit
//import SwiftUI
//import CoreData
//
//class trash: UIViewController, NSFetchedResultsControllerDelegate {
//    
//    //Note to self:
//    //Three things left to do
//    //- get class roster for other classes and display that
//    //- add edit functionality (and save using coredata?)
//    //-
//    
//    
//    @IBOutlet var buttons: [UIButton]!
//    var buttonTexts: [String] = []
//    //var p3 : [String] = ["DC", "HZ", "RA", "JS", "AS", "RC", "AS", " ", "LW", "EF", "RS", "SA", "CH", " ", "IK", " ", "GT", " ", "AA", "AL", "ZC", "VT", "MG", " ", "TW", "NB", "AT", "RU", "TB", " ", "CZ", "AS", "AM", "AP", " ", " "]
//    var p2: [String] = [] //populate later
//    var p5: [String] = [] //populate later
//    var currentPeriod: String = "P3"
//    @IBOutlet weak var periodChooser: UIButton!
//    var presentColor: UIColor = UIColor(red: 2/255, green: 101/255, blue: 17/255, alpha: 1)
//    var absentColor: UIColor = .red
//    var defaultColor : UIColor = UIColor.tintColor
//    @IBOutlet weak var showSwitch: UISwitch!
//    @IBOutlet weak var showSwitchText: UILabel!
//    @IBOutlet weak var darkModeSwitchText: UILabel!
//    var markEveryonePresentCounter = 0
//    
//    
//    
//    var frc : NSFetchedResultsController<StudentMO>!
//    var p3 : [StudentMO] = []
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Additional setup
//        setButtonLabels()
//        setPopupButton()
//        
//        
//        
//         let fR : NSFetchRequest<StudentMO> = StudentMO.fetchRequest()
//         let sD = NSSortDescriptor(key: "num", ascending: true)
//         fR.sortDescriptors = [sD]
//         
//         if let myAppDelegate = (UIApplication.shared.delegate as? AppDelegate) {
//             let context = myAppDelegate.persistentContainer.viewContext
//             frc = NSFetchedResultsController(fetchRequest: fR, managedObjectContext:
//                                                 context, sectionNameKeyPath: nil, cacheName: nil)
//             frc.delegate = self
//             do {
//                 try frc.performFetch()
//                 
//                 if let fetchedObjects = frc.fetchedObjects {
////                     MyStateItems = fetchedObjects //how to fix this
//                     //print(MyStateItems)
//                 }
//             } catch {
//                 print(error)
//             }
//             if MyStateItems.count == 0 {
//                 let seedStateItems = [
//                     StateItem("Alabama", "AL", "Montgomery", "Huntsville", "Alabama", "Alabama", 5024279, 135767),
//                     StateItem("Alaska", "AK", "Juneau", "Anchorage", "Alaska", "Alaska", 733391, 1723337),
//                     StateItem("Arizona", "AZ", "Phoenix", "Phoenix", "Arizona", "Arizona", 7151502, 295234),
//                     StateItem("Arkansas", "AR", "Little Rock", "Little Rock", "Arkansas", "Arkansas", 3011524, 137732),
//                     StateItem("California", "CA", "Sacramento", "Los Angeles", "California", "California", 39538223, 423967),
//                     StateItem("Colorado", "CO", "Denver", "Denver", "Colorado", "Colorado", 5773714, 269601),
//                     StateItem("Connecticut", "CT", "Hartford", "Brigeport", "Connecticut", "Connecticut", 3605944, 14357),
//                     StateItem("Delaware", "DE", "Dover", "Wilmington", "Delaware", "Delaware", 989948, 6446),
//                     StateItem("Florida", "FL", "Tallahassee", "Jacksonville", "Florida", "Florida", 21538187, 170312),
//                     StateItem("Georgia", "GA", "Atlanta", "Atlanta", "Georgia", "Georgia", 10711908, 153910),
//                     StateItem("Hawaii", "HI", "Honolulu", "Honolulu", "Hawaii", "Hawaii", 1455271, 28313),
//                     StateItem("Idaho", "ID", "Boise", "Boise", "Idaho", "Idaho", 1839106, 216443),
//                     StateItem("Illinois", "IL", "Springfield", "Chicago", "Illinois", "Illinois", 12812508, 149995),
//                     StateItem("Indiana", "IN", "Indianapolis", "Indianapolis", "Indiana", "Indiana", 6785528, 94326),
//                     StateItem("Iowa", "IA", "Des Moines", "Des Moines", "Iowa", "Iowa", 3190369, 145746),
//                     StateItem("Kansas", "KS", "Topeka", "Wichita", "Kansas", "Kansas", 2937880, 213100),
//                     StateItem("Kentucky", "KY", "Frankfort", "Louisville", "Kentucky", "Kentucky", 4505836, 104656),
//                     StateItem("Louisiana", "LA", "Baton Rouge", "New Orleans", "Lousiana", "Lousiana", 4657757, 135659),
//                     StateItem("Maine", "ME", "Augusta", "Portland", "Maine", "Maine", 1362359, 91633),
//                     StateItem("Maryland", "MD", "Annapolis", "Baltimore", "Maryland", "Maryland", 6177224, 32131),
//                     StateItem("Massachusetts", "MA", "Boston", "Boston", "Massachusetts", "Massachusetts", 7029917, 27336),
//                     StateItem("Michigan", "MI", "Lansing", "Detroit", "Michigan", "Michigan", 10077331, 250487),
//                     StateItem("Minnesota", "MN", "Saint Paul", "Minneapolis", "Minnesota", "Minnesota", 5706494, 225163),
//                     StateItem("Mississippi", "MS", "Jackson", "Jackson", "Mississippi", "Mississippi", 2961279, 125438),
//                     StateItem("Missouri", "MO", "Jefferson City", "Kansas City", "Missouri", "Missouri", 6154913, 180540)
//                 ]
//                 for item in seedStateItems {
//                     item.stateFlagImage = String("Flag_of_" + (item.stateName ?? "California") + ".svg")
//                     item.stateSealImage = String("Seal_of_" + (item.stateName ?? "California") + ".svg")
//                 }
//                 for item in seedStateItems {
//                     let addItemMO = StateItemMO(context: context)
//                     addItemMO.stateName = item.stateName
//                     addItemMO.abbreviation = item.abbreviation
//                     addItemMO.capitalCity = item.capitalCity
//                     addItemMO.largestCity = item.largestCity
//                     addItemMO.population = Int64(item.population)
//                     addItemMO.area = Int64(item.area)
//                     addItemMO.stateFlagImage = item.stateFlagImage
//                     addItemMO.stateSealImage = item.stateSealImage
//                     
//                     myAppDelegate.saveContext()
//                 }
//             }
//         }
//        
//        
//    }
//    
//    
//    @objc func buttonTapped(_ sender: UIButton) {
//        print("3")
//        if sender.tintColor != presentColor {
//            print("1")
//            sender.tintColor = presentColor
//        } else {
//            print("2")
//            sender.tintColor = absentColor
//        }
//    }
//    
//    func setButtonLabels() {
//        var arr: [String] = []
//        if currentPeriod == "P3" {
//            arr.append(contentsOf: p3)
//        } else {
//            print("hella naawwwwwww")
//        }
////        } else if currentPeriod == "P2" {
////            arr = p2
////        } else if currentPeriod == "P5" {
////            arr = p5
////        }
//        print("DEBUG: " + p3.description)
//        for i in 0..<buttons.count {
//            buttons[i].titleLabel?.text = arr[i] //currently crashes if period != 3
//        }
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        showSwitch.setOn(false, animated: true)
//        
//        
//        if let buttons = buttons {
//            for button in buttons {
//                
//                if let text = button.titleLabel?.text {
//                    buttonTexts.append(text)
//                } else {
//                }
//                                
//                button.setTitle("", for: .normal)
//                button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
//            }
//        }
//        
//        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
//        longPressRecognizer.minimumPressDuration = 0.5 // 0.5 seconds
//        for i in 0..<buttons.count {
//            buttons[i].addGestureRecognizer(longPressRecognizer)
//        }
//        
//        let addVC = ViewController()
//        self.present(addVC, animated: true, completion: nil)
//    }
//    
//    func setPopupButton() {
//        let popupClosure = {(action: UIAction) in
//            self.currentPeriod = action.title
//            self.setButtonLabels()
//        }
//        
//        periodChooser.menu = UIMenu(children: [
//            UIAction(title: "P2", handler: popupClosure),
//            UIAction(title: "P3", state: .on, handler: popupClosure),
//            UIAction(title: "P5", handler: popupClosure)])
//        
//        periodChooser.showsMenuAsPrimaryAction = true
//        periodChooser.changesSelectionAsPrimaryAction = true
//    }
//    
//    @IBAction func showInitialsToggled(_ sender: UISwitch) {
//        if sender.isOn {
//            var count = 0
//            for button in buttons {
//                button.setTitle(buttonTexts[count], for: .normal)
//                count = count + 1
//            }
//        } else {
//            for button in buttons {
//                button.setTitle("", for: .normal)
//            }
//        }
//    }
//    
//    @IBAction func darkModeToggled(_ sender: UISwitch) {
//        if sender.isOn {
//            view.backgroundColor = .black
//            showSwitchText.textColor = .white
//            darkModeSwitchText.textColor = .white
//            for button in buttons {
//                button.setTitleColor(.white, for: .normal)
//            }
//        } else {
//            view.backgroundColor = .white
//            showSwitchText.textColor = .black
//            darkModeSwitchText.textColor = .black
//            for button in buttons {
//                button.setTitleColor(.black, for: .normal)
//            }
//        }
//    }
//    
//    @objc func handleLongPress(_ gestureRecognizer: UILongPressGestureRecognizer) {
//        //if gestureRecognizer.state == .ended {
//            if let button = gestureRecognizer.view as? UIButton {
//                print("YEASSSS")
//                button.tintColor = .systemBlue
//                // Show your detail message or tooltip here
//                // For example, you can use a UIAlertController to display a message
//                //            let alertController = UIAlertController(title: "Detail Message", message: "This is your detail message or tooltip.", preferredStyle: .alert)
//                //            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                //            present(alertController, animated: true, completion: nil)
//            }
//        
//        
//    }
//    
//    @IBAction func markEveryonePresentToggled(_ sender: Any) {
//        markEveryonePresentCounter += 1
//        
//        if markEveryonePresentCounter % 2 == 1 {
//            for button in buttons {
//                button.tintColor = presentColor
//            }
//        } else {
//            for button in buttons {
//                button.tintColor = defaultColor
//            }
//        }
//    }
//    
//    
//    @IBAction func copyBtnClicked(_ sender: Any) {
//        //generate an alert, and copy the data
//        copyData()
//        
//        let alertView = UIAlertController(title: "Copy success!", message: "", preferredStyle: .alert)
//       
//        alertView.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//       
//        self.present(alertView, animated: true, completion: nil)
//        
//    }
//    
//    func copyData() {
//        var absentStudents: [String] = []
//        for button in buttons {
//            if button.tintColor == absentColor {
//                print(button.titleLabel?.text!)
//                absentStudents.append((button.titleLabel?.text!)!)
//            }
//        }
//        let pasteboard = UIPasteboard.general
//        pasteboard.string = "Absent: " + absentStudents.description
//    }
//    
//    
//}

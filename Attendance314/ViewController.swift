//
//  ViewController.swift
//  Attendance314
//
//  Created by Araav Nayak on 3/16/24.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let contentView = ContentView(vc: self)
        let hostingController = UIHostingController(rootView: contentView)

        // Add the hosting controller as a child of this view controller
        addChild(hostingController)
        view.addSubview(hostingController.view)

        // Setup constraints if needed
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        hostingController.didMove(toParent: self)
    }
    
    func end() {
        //let attendanceVC = AttendanceVC() // Instantiate the view controller you want to present
        self.dismiss(animated: true)
        // Present the attendanceVC from the current view controller
        //self.present(attendanceVC, animated: true, completion: nil)
//        let hostingController = AttendanceVC()
//        addChild(hostingController)
//        view.addSubview(hostingController.view)
//        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
//            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        ])
//        
//        hostingController.didMove(toParent: self)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

////
////  AttendanceView.swift
////  Attendance314
////
////  Created by Araav Nayak on 3/16/24.
////
//
//import UIKit
//import SwiftUI
//
//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let contentView = ContentView()
//        let hostingController = UIHostingController(rootView: contentView)
//
//        // Add the hosting controller as a child of this view controller
//        addChild(hostingController)
//        view.addSubview(hostingController.view)
//
//        // Setup constraints if needed
//        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
//            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        ])
//        
//        hostingController.didMove(toParent: self)
//    }
//    
//}

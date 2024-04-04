//
//  ContentView.swift
//  LoginScreen
//
//  Created by Araav on 3/16/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername: Float = 0
    @State private var wrongPassword: Float  = 0
    @State private var showingLoginScreen = false
    @State private var isPresented = false
    
    var vc: ViewController
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                VStack {
                    Text("Welcome!")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        .foregroundColor(.black.opacity(1))
                    Text("P3 APCS Attendance App")
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .foregroundColor(.black.opacity(0.8))
//                    Text("Developer: Araav Nayak")
//                        .padding()
//                        .frame(width: 300, height: 50)
//                        .background(Color.black.opacity(0.05))
//                        .cornerRadius(10)
//                        .foregroundColor(.black.opacity(0.8))
                    Button("Begin") {
                        vc.end()
                        //dismiss()
                        //self.isPresented.toggle()
                        //                        NavigationLink(destination: AttendanceVC()) {
                        //                            Text("Go here!")
                        //                        }
//                        UIApplication.shared.windows.first?.rootViewController?.present(AttendanceVC(), animated: true, completion: nil)
//                        NavigationLink(destination: AttendanceVC()) {
//                                Text("Go here!")
//                        }
                    }
                    
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    
                }
               
                }.navigationBarHidden(true)
            }
    }
    
        func dismiss() {
            // Find the parent view controller
//            var parentViewController: UIViewController? = self.next as? UIViewController
//            while parentViewController?.presentingViewController == nil && parentViewController?.parent != nil {
//                parentViewController = parentViewController?.parent
//            }
            
            // Dismiss the parent view controller (if it exists and is presented modally)
            print("dismiss function called????")
            vc.end()
        }
    
    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

struct PresentedView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Text("Presented View")
            Button("Dismiss") {
                self.isPresented = false
            }
        }
    }
}

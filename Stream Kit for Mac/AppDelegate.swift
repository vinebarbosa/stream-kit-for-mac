//
//  AppDelegate.swift
//  Stream Kit for Mac
//
//  Created by Vinícios Barbosa on 24/10/24.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        window = NSWindow(
            contentRect: NSMakeRect(0, 0, 1000, 700),
            styleMask: [.titled, .miniaturizable, .closable, .resizable],
            backing: .buffered,
            defer: false
        )
        
        window.title = "Stream Kit"
        window.makeKeyAndOrderFront(nil)
        window.center()
        
        
        var rootViewController = GrettingsViewController()
        
        rootViewController.configure(onNextStepTapped: natigateToNextViewController)
        
        window.contentViewController = rootViewController
    }
    
    
    func natigateToNextViewController() {
        
    }
}

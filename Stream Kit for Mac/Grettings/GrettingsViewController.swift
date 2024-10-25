//
//  GrettingsViewController.swift
//  Stream Kit for Mac
//
//  Created by Vinícios Barbosa on 27/10/24.
//

import Cocoa

class GrettingsViewController: NSViewController {
    
    private var grettingsView: GrettingsView!
    
    override func loadView() {
        grettingsView = GrettingsView()
        self.view = grettingsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configure(onNextStepTapped: @escaping () -> Void) {
        grettingsView.onNextStep = onNextStepTapped
    }
    
}
 

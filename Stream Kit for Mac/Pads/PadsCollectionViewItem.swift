//
//  PadsCollectionViewItem.swift
//  Stream Kit for Mac
//
//  Created by Vinícios Barbosa on 26/10/24.
//

import Cocoa

class PadsCollectionViewItem: NSCollectionViewItem {

    static let identifier = NSUserInterfaceItemIdentifier("PadsCollectionViewItem")

    lazy var padButton: NSButton = {
        let button = NSButton(title: "", target: nil, action: nil)
        button.wantsLayer = true
        button.bezelStyle = .regularSquare
        button.isBordered = false
        button.layer?.backgroundColor = NSColor(named: "BackgroundPrimaryColor")?.cgColor
        button.layer?.cornerRadius = 16
        button.layer?.borderWidth = 1
        button.layer?.borderColor = NSColor(named: "BorderColor")?.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    override func loadView() {
        view = NSView()
        view.addSubview(padButton)
     
        NSLayoutConstraint.activate([
            padButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            padButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            padButton.topAnchor.constraint(equalTo: view.topAnchor),
            padButton.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}


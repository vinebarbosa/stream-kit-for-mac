//
//  PadsView.swift
//  Stream Kit for Mac
//
//  Created by Vinícios Barbosa on 26/10/24.
//

import Cocoa

class PadsView: NSView {
    lazy var logoImageView: NSImageView = {
        let imageView = NSImageView()
        imageView.image = NSImage(named: "LogoImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var logoTextField: NSTextField = {
        let textField = NSTextField(labelWithString: "Stream Kit")
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .accent
        textField.font = NSFont.systemFont(ofSize: 16, weight: .medium)

        return textField
    }()
    
    lazy var padsCollectionView: NSCollectionView = {
        let collectionView = NSCollectionView()

        let layout = NSCollectionViewFlowLayout()
        layout.itemSize = NSSize(width: 80, height: 80)
        layout.minimumInteritemSpacing = 18
        layout.minimumLineSpacing = 18
        
        collectionView.backgroundColors = [.backgroundSecondary ]

        collectionView.collectionViewLayout = layout
        collectionView.register(PadsCollectionViewItem.self, forItemWithIdentifier: PadsCollectionViewItem.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    lazy var actionSetupView: NSView  = {
        let view = NSView()
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor(named: "BackgroundPrimaryColor")?.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        setupView()
        setHierrarchy()
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
        setHierrarchy()
        setConstrains()
    }
    
    func setupView() {
        self.wantsLayer = true
        self.frame = NSRect(x: 0, y: 0, width: 1000, height: 700)
        self.layer?.backgroundColor = NSColor(named: "BackgroundSecondaryColor")?.cgColor
    }

    func setHierrarchy() {
        addSubview(logoImageView)
        addSubview(logoTextField)
        addSubview(padsCollectionView)
        addSubview(actionSetupView)
    }

    func setConstrains() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 42),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64),
            logoTextField.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 10),
            logoTextField.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor),
            padsCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: 140),
            padsCollectionView.centerXAnchor.constraint(equalTo: centerXAnchor),
            padsCollectionView.heightAnchor.constraint(equalToConstant: 312),
            padsCollectionView.widthAnchor.constraint(equalToConstant: 472),
            actionSetupView.bottomAnchor.constraint(equalTo: bottomAnchor),
            actionSetupView.leadingAnchor.constraint(equalTo: leadingAnchor),
            actionSetupView.trailingAnchor.constraint(equalTo: trailingAnchor),
            actionSetupView.heightAnchor.constraint(equalToConstant: frame.height * 0.3)
        ])
    }
}

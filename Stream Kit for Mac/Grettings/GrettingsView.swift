//
//  GrettingsView.swift
//  Stream Kit for Mac
//
//  Created by Vinícios Barbosa on 27/10/24.
//

import Cocoa

class GrettingsView: NSView {
    
    var onNextStep: (() -> Void)?
    
    
    lazy var grettingTextField: NSTextField = {
        let textField = NSTextField(labelWithString: "Seja bem-vindo ao")
        
        textField.textColor = .accent
        textField.font = NSFont.systemFont(ofSize: 16, weight: .light)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isEditable = false
        
        return textField
    }()
    
    lazy var logoStackView: NSStackView = {
        let view = NSStackView()
        view.orientation = .horizontal
        view.spacing = 24
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var logoImageView: NSImageView = {
        let imageView = NSImageView()
        
        imageView.image = NSImage(named: "LogoImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.imageScaling = .scaleProportionallyUpOrDown
        
        return imageView
    }()
    
    lazy var logoTextField: NSTextField = {
        let textField = NSTextField(labelWithString: "Stream Kit")
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .accent
        textField.font = NSFont.systemFont(ofSize: 40, weight: .semibold)

        return textField
    }()
    
    lazy var descriptionTextField: NSTextField = {
        let textField = NSTextField(labelWithString: "Primeiro, vamos conectar o seu iPhone para que você possa gerenciar o Mac a partir dele.")
        textField.textColor = .accent
        textField.font = NSFont.systemFont(ofSize: 16, weight: .light)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.lineBreakMode = .byWordWrapping
        textField.maximumNumberOfLines = 0
        textField.alignment = .center
        
        return textField
    }()
    
    lazy var button: NSButton = {
        let button = NSButton(title: "Vamos lá", target: self, action: #selector(onButtonTapped))
        
        button.wantsLayer = true
        button.bezelStyle = .regularSquare
        button.layer?.backgroundColor = NSColor.primary.cgColor
        button.layer?.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isBordered = false
        button.font = NSFont.systemFont(ofSize: 16, weight: .medium)
        button.contentTintColor = .white
        
        return button
    }()

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        setupView()
        setHierarchy()
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
        setHierarchy()
        setConstrains()
    }
    
    func setupView() {
        self.wantsLayer = true
        self.frame = NSRect(x: 0, y: 0, width: 1000, height: 700)
        self.layer?.backgroundColor = NSColor(named: "BackgroundSecondaryColor")?.cgColor
    }
    
    func setHierarchy() {
        self.addSubview(grettingTextField)
        self.addSubview(logoStackView)
        self.addSubview(descriptionTextField)
        self.addSubview(button)
        
        logoStackView.addArrangedSubview(logoImageView)
        logoStackView.addArrangedSubview(logoTextField)
    }
    
    func setConstrains() {
        NSLayoutConstraint.activate([
            grettingTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 218),
            grettingTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            logoStackView.topAnchor.constraint(equalTo: grettingTextField.bottomAnchor, constant: 32),
            logoStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            logoImageView.heightAnchor.constraint(equalToConstant: 64),
            logoImageView.widthAnchor.constraint(equalToConstant: 53.42),
            
            descriptionTextField.topAnchor.constraint(equalTo: logoStackView.bottomAnchor, constant: 32),
            descriptionTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            descriptionTextField.widthAnchor.constraint(equalToConstant: 445),
            
            button.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 32),
            button.widthAnchor.constraint(equalToConstant: 235),
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func onButtonTapped() {
        self.onNextStep?()
    }
}

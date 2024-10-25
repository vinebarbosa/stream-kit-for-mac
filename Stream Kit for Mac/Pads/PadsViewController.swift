//
//  PadsViewController.swift
//  Stream Kit for Mac
//
//  Created by Vinícios Barbosa on 24/10/24.
//

import Cocoa

class PadsViewController: NSViewController {

    let items = Array(1...15)
    
    private var padsView: PadsView!
    
    override func loadView() {
        self.padsView = PadsView()
        self.view = padsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.padsView.padsCollectionView.delegate = self
        self.padsView.padsCollectionView.dataSource = self
    }
}


extension PadsViewController: NSCollectionViewDataSource, NSCollectionViewDelegate {
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: PadsCollectionViewItem.identifier, for: indexPath)
        return item
    }
    
    
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        if let indexPath = indexPaths.first {
            print("Botão clicado: \(items[indexPath.item])")
        }
    }
    
}

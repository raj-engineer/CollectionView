//
//  GalleryVC.swift
//  CollectionView
//
//  Created by Rajesh on 06/11/18.
//  Copyright © 2018 Rajesh. All rights reserved.
//

import UIKit

class GalleryVC: UIViewController {
    let photoArr = ["abc"]
    //MARK:- CollectionView Attribute
    let leftAndRightPadding:CGFloat = 5.0
    var numberOfItemsPerRow:CGFloat = 3.0
    
    
    @IBOutlet weak var collectionViewPhoto: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollection()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setUpCollection()
        
    }
    func setUpCollection(){
        collectionViewPhoto.delegate = self
        collectionViewPhoto.dataSource = self
        let collectionViewWidth = collectionViewPhoto?.frame.width //UIScreen.main.bounds.width // //
        let itemWidth=(collectionViewWidth! - leftAndRightPadding*(numberOfItemsPerRow-1))/numberOfItemsPerRow
        
        let layout = collectionViewPhoto?.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        layout.minimumLineSpacing = leftAndRightPadding
        layout.minimumInteritemSpacing = leftAndRightPadding
        print("item Width",itemWidth)
    }
    
}

//MARK: UICollectionViewDelegate
extension GalleryVC : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Did select", indexPath.row)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("did Deselect ItemAt ")
        
    }
    
    
}
//MARK: UICollectionViewDataSource
extension GalleryVC : UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        cell.displayContent(row: indexPath.row, name: photoArr)
        return cell
        
    }
    
}

class  PhotoCell : UICollectionViewCell{
    
    @IBOutlet weak var imageViewPhoto: UIImageView!
    
    func displayContent(row : Int , name : [String]) {
        let item = name[0] // name[row]
        imageViewPhoto.image = UIImage(named: item)
        
    }
   
}

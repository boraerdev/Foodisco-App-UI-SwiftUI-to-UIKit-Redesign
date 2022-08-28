//
//  HeaderCollectionReusableView.swift
//  uikitTest
//
//  Created by Bora Erdem on 26.08.2022.
//

import UIKit
import SnapKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "HeaderCollectionReusableView"
    
    let oneriTitle: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    let image: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(systemName: "arrow.up.arrow.down")
        image.tintColor = .systemPink
        image.contentMode = .scaleToFill
        return image
    }()
    
    public func configure(title: String){
        oneriTitle.text = title
        makeLayou()
    }
    
    func makeLayou(){
        addSubview(oneriTitle)
        oneriTitle.snp.makeConstraints { make in
            make.left.equalTo(super.snp.left)
                
            make.centerY.equalTo(super.snp.centerY)
        }
        
        addSubview(image)
        image.snp.makeConstraints { make in
            make.width.height.equalTo(25)
            make.right.equalTo(super.snp.right)
                
                
            make.centerY.equalTo(super.snp.centerY)
        }
    }
    
    
    
    
    
}

//
//  LeftMenuView.swift
//  uikitTest
//
//  Created by Bora Erdem on 28.08.2022.
//

import UIKit
import SnapKit

class LeftMenuView: UIView {
    
    let adSoyad: UILabel = {
       let label = UILabel()
        label.text = "Bora Erdem"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .systemBackground
        return label
    }()
    
    let hosGeldin: UILabel = {
       let label = UILabel()
        label.text = "Hoş Geldin"
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .systemBackground
        return label
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        createMakes()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createMakes(){
        addSubview(adSoyad)
        addSubview(hosGeldin)
        
       
        adSoyad.snp.makeConstraints { make in
            make.left.equalTo(safeAreaLayoutGuide)
                .offset(20)
            make.top.equalTo(safeAreaLayoutGuide)
                .offset(100)
        }
        
        hosGeldin.snp.makeConstraints { make in
            make.left.equalTo(adSoyad)
            make.bottom.equalTo(adSoyad.snp.top)
                
        }
    }
    
    

}

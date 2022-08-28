//
//  ViewController.swift
//  uikitTest
//
//  Created by Bora Erdem on 26.08.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let listTitles: [String] = ["Önerilenler","Mutfaklar","Tarifler"]
    
    let dashImage: UIButton = {
       let image = UIButton()
        let conf = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .small)
        image.setImage(UIImage(systemName: "list.dash", withConfiguration: conf), for: .normal)
        image.tintColor = .label
        return image
    }()
    
    let plus: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(systemName: "plus")
        image.tintColor = .systemPink
        return image
    }()
    
    let heart: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(systemName: "heart.fill")
        image.tintColor = .systemPink
        return image
    }()
    
    let magni: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(systemName: "magnifyingglass")
        image.tintColor = .label
        return image
    }()
    
    let hosGeldin: UILabel = {
        let label = UILabel()
        label.text = "Hoş Geldin"
        label.font = .systemFont(ofSize: 11, weight: .regular)
        return label
    }()
    
    let adSoyad: UILabel = {
        let label = UILabel()
        label.text = "Bora Erdem"
        label.font = .systemFont(ofSize: 13, weight: .bold)
        return label
    }()
    
    let divider: UIView = {
       let div = UIView()
        div.backgroundColor = .separator
        return div
    }()
    
    let blackBG: UIView = {
       let bgv = UIView()
        bgv.backgroundColor = .black.withAlphaComponent(0.5)
        bgv.isHidden = true
        return bgv
        
    }()
    
    lazy var leftMenu : UIView = {
        let view = LeftMenuView()
        view.isHidden = true
        return view
    }()
    
    let collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero,
              collectionViewLayout: UICollectionViewCompositionalLayout{sectionIndex,_ -> NSCollectionLayoutSection? in
            
            switch sectionIndex {
            case 0:
                let item = NSCollectionLayoutItem(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1)))
                item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
                let group = NSCollectionLayoutGroup.vertical(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(0.95),
                    heightDimension: .absolute(160)),
                    subitem: item,
                    count: 1
                )
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPaging
                
                let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                          heightDimension: .absolute(50.0))
                            let header = NSCollectionLayoutBoundarySupplementaryItem(
                                layoutSize: footerHeaderSize,
                                elementKind: UICollectionView.elementKindSectionHeader,
                                alignment: .top)
                section.boundarySupplementaryItems = [header]

                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
                return section
                
                
            
            case 1:
                let item = NSCollectionLayoutItem(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1)))
                item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .absolute(80),
                    heightDimension: .absolute(80)),
                    subitem: item,
                    count: 1
                )
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                
                let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                          heightDimension: .absolute(50.0))
                            let header = NSCollectionLayoutBoundarySupplementaryItem(
                                layoutSize: footerHeaderSize,
                                elementKind: UICollectionView.elementKindSectionHeader,
                                alignment: .top)
                section.boundarySupplementaryItems = [header]

                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
                return section
                
                
                
            case 2:
                let item = NSCollectionLayoutItem(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1)))
                item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
                let group = NSCollectionLayoutGroup.vertical(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(100)),
                    subitem: item,
                    count: 1
                )
                let section = NSCollectionLayoutSection(group: group)
                
                let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                          heightDimension: .absolute(50.0))
                            let header = NSCollectionLayoutBoundarySupplementaryItem(
                                layoutSize: footerHeaderSize,
                                elementKind: UICollectionView.elementKindSectionHeader,
                                alignment: .top)
                section.boundarySupplementaryItems = [header]

                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
                return section
                
                
                
            default:
                let item = NSCollectionLayoutItem(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1)))
                item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
                let group = NSCollectionLayoutGroup.vertical(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(0.95),
                    heightDimension: .absolute(160)),
                    subitem: item,
                    count: 1
                )
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPaging
                
                                return section
            }
            
        })
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collection.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
        return collection
    }()
    
    let textFiled: UITextField = {
       let field = UITextField()
        field.placeholder = "Yemek veya tarif arayın"
        field.backgroundColor = .white
        field.layer.cornerRadius = 5
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        field.leftView = paddingView
        field.leftViewMode = .always
        return field
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        view.backgroundColor = .secondarySystemBackground
        collectionView.backgroundColor = .secondarySystemBackground
        addSnaps()
        addTarget()
    }
    
    
    func addSnaps() {
        view.addSubview(heart)
        view.addSubview(plus)
        view.addSubview(dashImage)
        view.addSubview(textFiled)
        view.addSubview(magni)
        view.addSubview(divider)
        view.addSubview(hosGeldin)
        view.addSubview(adSoyad)
        view.addSubview(collectionView)
        view.addSubview(blackBG)
        view.addSubview(leftMenu)
        
        dashImage.snp.makeConstraints { make in
            make.left.top.equalTo(view.safeAreaLayoutGuide)
                .offset(10)
            make.width.height.equalTo(25)
        }
        
        heart.snp.makeConstraints { make in
            make.top.equalTo(dashImage)
            make.right.equalTo(view.safeAreaLayoutGuide)
                .offset(-10)
            make.width.height.equalTo(25)
        }
        
        plus.snp.makeConstraints { make in
            make.top.equalTo(heart)
            make.right.equalTo(heart.snp.left)
                .offset(-16)
            make.width.height.equalTo(25)
        }
        
        textFiled.snp.makeConstraints { make in
            make.top.equalTo(dashImage.snp.bottom)
                .offset(16)
            make.left.equalTo(dashImage)
            make.height.equalTo(35)
            make.right.equalTo(plus.snp.right)
        }
        
        magni.snp.makeConstraints { make in
            make.right.equalTo(heart.snp.right)
            make.centerY.equalTo(textFiled.snp.centerY)
            make.width.height.equalTo(25)
        }
        
        divider.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(textFiled.snp.bottom)
                .offset(16)
            make.height.equalTo(1)
        }
        
        
        hosGeldin.snp.makeConstraints { make in
            make.left.equalTo(dashImage.snp.right)
                .offset(16)
            make.top.equalTo(dashImage)
                .offset(-2)
        }
        
        adSoyad.snp.makeConstraints { make in
            make.top.equalTo(hosGeldin.snp.bottom)
                
            make.left.equalTo(hosGeldin)
        }
        
        collectionView.snp.makeConstraints { make in
            make.left.equalTo(dashImage)
            make.right.equalToSuperview()
            
            make.bottom.equalToSuperview()
            make.top.equalTo(divider.snp.bottom)
        }
        
    
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(closeLeftMenu))
        blackBG.isUserInteractionEnabled = true
        blackBG.addGestureRecognizer(gesture)
        
        
        
        blackBG.snp.makeConstraints { make in
            make.top.right.bottom.equalToSuperview()
            make.left.equalTo(leftMenu.snp.right)
        }
        
        leftMenu.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview()
            make.right.equalToSuperview()
                .offset(-80)
        }
        
        
        
        
        
    }
    
    func addTarget(){
        dashImage.addTarget(self, action: #selector(dashTapped), for: .touchUpInside)
    }
    
    @objc func dashTapped(){
        leftMenu.isHidden.toggle()
        blackBG.isHidden.toggle()
    }
    
    @objc func closeLeftMenu(){
        leftMenu.isHidden = true
        blackBG.isHidden = true
    }

}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.contentView.backgroundColor = .green
        
        cell.contentView.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
        header.configure(title: listTitles[indexPath.section])
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 40)
    }
    
}


 

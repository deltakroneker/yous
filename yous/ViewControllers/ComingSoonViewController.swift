//
//  ComingSoonViewController.swift
//  yous
//
//  Created by Nikola Milic on 10/15/18.
//  Copyright © 2018 Nikola Milic. All rights reserved.
//

import UIKit

class ComingSoonViewController: UIViewController {
    
    let sideMargin: CGFloat = 15

    let soonImageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "soon"))
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let comingSoonLabel: UILabel = {
        let label = UILabel()
        label.text = "Coming Soon"
        label.textAlignment = .center
        label.font = UIFont(name: "EncodeSans-Regular", size: 35)
        return label
    }()
    
    let inConstructionLabel: UILabel = {
        let label = UILabel()
        label.text = "This page is in construction and will be available soon, you may contact our experts through chat.\n\n Thanks!"
        label.font = UIFont(name: "EncodeSans-Regular", size: 16)
        label.textColor = UIColor.gray
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var chatNowButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Chat Now", for: .normal)
        button.backgroundColor = UIColor(hexString: "FA497C")
        button.layer.masksToBounds = false
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 20.0)
        button.layer.shadowOpacity = 0.20
        button.layer.shadowRadius = 25
        button.titleLabel?.font = UIFont(name: "EncodeSans-Regular", size: 20)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(chatNowButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        [soonImageView, comingSoonLabel, inConstructionLabel, chatNowButton].forEach {
            view.addSubview($0)
        }
        
        setupSnapKitConstraints()
    }
    
    // MARK: Button pressed
    
    @objc func chatNowButtonPressed() {
        
    }
    

    func setupSnapKitConstraints() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        soonImageView.snp.makeConstraints { (make) in
            make.leading.equalTo(safeArea).offset(65)
            make.trailing.equalTo(safeArea).inset(65)
            make.width.equalTo(soonImageView.snp.height)
            make.centerX.equalTo(safeArea)
            make.top.equalTo(safeArea).offset(50)
        }
        
        comingSoonLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(safeArea).offset(50)
            make.trailing.equalTo(safeArea).inset(50)
            make.centerX.equalTo(safeArea)
            make.top.equalTo(soonImageView.snp_bottomMargin).offset(20)
        }
        
        inConstructionLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(safeArea).offset(2*sideMargin)
            make.trailing.equalTo(safeArea).inset(2*sideMargin)
            make.centerX.equalTo(safeArea)
            make.top.equalTo(comingSoonLabel.snp_bottomMargin).offset(40)
        }
        
        chatNowButton.snp.makeConstraints { (make) in
            make.top.equalTo(inConstructionLabel.snp_bottomMargin).offset(60)
            make.leading.equalTo(safeArea).offset(2*sideMargin)
            make.trailing.equalTo(safeArea).inset(2*sideMargin)
            make.centerX.equalTo(safeArea)
            make.height.equalTo(60)
        }
    }

}

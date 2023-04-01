//
//  AlarmViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit

class alarmViewController: UIViewController {
    
    var uiViewList: [UIView] = []
    var commonViewList: [UIView] = []

    let userProfileButton = commonView().roundingButton()
    let envelopeButton = commonView().envelopeButton()
    let titleTextButton = commonView().titleTextButton(titleText: "알람관리")
    let subTextLabel = commonView().commonTextLabel(labelText: "매일 꾸준한 습관", size: 14)
    let mainTextLabel = commonView().commonTextLabel(labelText: "섭취알람으로\n매일 섭취관리하세요.", size: 30)
    let commonUiView = commonView().commonUiView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setSameBackgroundColor()
        addOnView()
        addOnCommonUiView()
        viewLayout()
        commonUiViewLayout()
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.white
                
        userProfileButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(74)
            make.trailing.equalTo(view).offset(-31)
            make.size.equalTo(CGSize(width: 45, height: 45))
        }
        
        envelopeButton.snp.makeConstraints { make in
            make.top.equalTo(userProfileButton.snp.top).offset(10)
            make.trailing.equalTo(userProfileButton.snp.leading).offset(-10)
            make.size.equalTo(CGSize(width: 36, height: 26))
        }
        
        titleTextButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(76)
            make.leading.equalTo(view).offset(31)
            make.size.equalTo(CGSize(width: 122, height: 44))
        }
        
        commonUiView.snp.makeConstraints { make in
            make.top.equalTo(envelopeButton.snp.bottom).offset(40)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view)
        }
    }
    
    private func addOnView() {
        uiViewList = [commonUiView, userProfileButton, envelopeButton, titleTextButton]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
    }
    
    private func commonUiViewLayout() {
        
        subTextLabel.snp.makeConstraints { make in
            make.top.equalTo(titleTextButton.snp.bottom).offset(45)
            make.leading.equalTo(titleTextButton)
        }
        
        mainTextLabel.snp.makeConstraints { make in
            make.top.equalTo(subTextLabel.snp.bottom).offset(15)
            make.leading.equalTo(subTextLabel).offset(-1.8)
        }
    }
    
    private func addOnCommonUiView() {
        commonViewList = [subTextLabel, mainTextLabel]
        
        for uiView in commonViewList {
            commonUiView.addSubview(uiView)
        }
    }
    
}

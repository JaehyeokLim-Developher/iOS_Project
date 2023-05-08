//
//  AlarmAddViewTableCell.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/02.
//

import UIKit
import SnapKit

class AlarmAddViewTableCell: UITableViewCell {
    
    var contentViewList: [UIView] = []
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 17)
        
        return label
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        
        textField.backgroundColor = UIColor.clear
        textField.placeholder = "알람"
        textField.textColor = UIColor.white
        textField.textAlignment = .right
        textField.font = UIFont.systemFont(ofSize: 17)
        
        return textField
    }()
    
    let repeatSwitch: UISwitch = {
        let repeatSwitch = UISwitch()
        
        repeatSwitch.isOn = false
        repeatSwitch.onTintColor = UIColor.systemBlue
        return repeatSwitch
    }()
    
    let repeatDaysButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "greaterthan"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.tintColor = UIColor.placeholderText
        
        return button
    }()
    
    let repeatDaysLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = UIColor.placeholderText
        label.font = UIFont.systemFont(ofSize: 17)
        
        return label
    }()
    
    let userPickingButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "greaterthan"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.tintColor = UIColor.placeholderText
        
        return button
    }()
    
    let userPickingLabel: UILabel = {
        let label = UILabel()
        
        label.text = "사용자"
        label.textColor = UIColor.placeholderText
        label.font = UIFont.systemFont(ofSize: 17)
        
        return label
    }()
    
    private func layout() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(12)
            make.leading.equalTo(12.5)
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(10.5)
            make.trailing.equalTo(-10)
        }
        
        repeatSwitch.snp.makeConstraints { make in
            make.top.equalTo(6.5)
            make.trailing.equalTo(-10)
        }
        
        repeatDaysButton.snp.makeConstraints { make in
            make.top.equalTo(13.7)
            make.trailing.equalTo(-10)
            make.size.equalTo(CGSize(width: 12.5, height: 15.5))
        }
        
        repeatDaysLabel.snp.makeConstraints { make in
            make.top.equalTo(10.85)
            make.trailing.equalTo(repeatDaysButton.snp.leading).offset(-8)
        }
        
        userPickingButton.snp.makeConstraints { make in
            make.top.equalTo(13.7)
            make.trailing.equalTo(-10)
            make.size.equalTo(CGSize(width: 12.5, height: 15.5))
        }
        
        userPickingLabel.snp.makeConstraints { make in
            make.top.equalTo(10.85)
            make.trailing.equalTo(repeatDaysButton.snp.leading).offset(-8)
        }
    }
    
    private func addSubview() {
        contentViewList = [titleLabel, textField, repeatSwitch, repeatDaysButton, repeatDaysLabel, userPickingButton, userPickingLabel]
        
        for uiView in contentViewList {
            contentView.addSubview(uiView)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        textField.isHidden = true
        repeatSwitch.isHidden = true
        repeatDaysButton.isHidden = true
        repeatDaysLabel.isHidden = true
        userPickingButton.isHidden = true
        userPickingLabel.isHidden = true 
    }
    
    func hiddenFucntion(titleLabelText: String,repeatDaysLabelBool: Bool, repeatDaysButtonBool: Bool, textFieldBool: Bool, userPickingLabelBool: Bool, userPickingButtonBool: Bool, repeatSwitchBool: Bool) {
        titleLabel.text = titleLabelText
        repeatDaysLabel.isHidden = repeatDaysLabelBool
        repeatDaysButton.isHidden = repeatDaysButtonBool
        textField.isHidden = textFieldBool
        userPickingLabel.isHidden = userPickingLabelBool
        userPickingButton.isHidden = userPickingButtonBool
        repeatSwitch.isHidden = repeatSwitchBool
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        layout()
        textField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func textFieldDidChange(_ sender: Any?) {
        alarmTextFieldText = textField.text ?? "없음"
    }
}

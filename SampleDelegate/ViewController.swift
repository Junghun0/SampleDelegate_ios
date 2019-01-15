//
//  ViewController.swift
//  SampleDelegate
//
//  Created by 박정훈 on 15/01/2019.
//  Copyright © 2019 swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textfield.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        print("textFieldShouldBeginEditing Method / 텍스트필드 편집이 시작")
        return true
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField){
        print("textFieldDidBeginEditing / 텍스트 필드의 편집이 시작")
    }
    
    public func textFieldShouldClear(_ textField: UITextField) -> Bool{
        print("textFieldShouldClear Method / 텍스트 필드의 내용이 삭제")
        return true
    } // called when clear button pressed. return NO to ignore (no notifications)
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        print("textFieldShouldReturn Method / 텍스트 필드의 리턴키 눌림")
        return true
    } // called when 'return' key pressed. return NO to ignore.
    
    public func textFieldDidEndEditing(_ textField: UITextField){
        print("textFieldDidEndEditing / 텍스트 필드의 편집이 종료되었을 때")
    }
    
    public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool{
        print("textFieldShouldEndEditing / 텍스트 필드의 편집이 종료될 때")
        return true
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        print("textField Method / 텍스트 필드의 내용이 변경될 때 \(string)")
        return true
    }
    
    
    
}


//
//  ImagePickerViewController.swift
//  SampleDelegate
//
//  Created by 박정훈 on 15/01/2019.
//  Copyright © 2019 swift. All rights reserved.
//

import Foundation
import UIKit

class ImagePickerViewController : UIViewController{

    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pick(_ sender: Any) {
        //이미지 피커 컨트롤러 인스턴스 생성
        let picker = UIImagePickerController()
        //핸드폰으로 앨범에 접근하려면 Info.plist 파일에서 privacy - photo library usage description 키를 추가하고 yes 로 변경해주어야함(권한처리)
        picker.sourceType = .photoLibrary //이미지 소스로 사진 라이브러리 선택
        picker.allowsEditing = true // 이미지 편집 기능 On
        
        picker.delegate = self
        
        //이미지 피커 컨트롤러 실행
        self.present(picker, animated: false)
    }
}

// MARK:- 이미지피커컨트롤러 메소드
extension ImagePickerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    //이미지 피커에서 이미지를 선택하지 않고 취소했을 때 호출되는 메소드
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: false, completion: { () in // image picker controller 가 완전히 종료된후 실행될 부분
            //알림창 호출
            let alert = UIAlertController(title: "", message: "이미지 선택이 취소되었습니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
            self.present(alert,animated: false)
        })
    }
    
    //이미지 피커에서 이미지를 선택했을 때 호출되는 메소드
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        //이미지 피커 컨트롤러 닫기
        picker.dismiss(animated: false, completion: { () in
            let img = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
            self.imgView.image = img
        })
    }
}

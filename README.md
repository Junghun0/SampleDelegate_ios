### SampleDelegate_ios
---
1. 텍스트 필드에 대한 Delegate 사용하기


   1_1. 텍스트 필드에 대한 Delegate 프로토콜 구현
  
  
    1_2. 텍스트 필드의 델리게이트 속성을 뷰 컨트롤러에 연결
  
  
    1_3. Delegate 프로토콜 구현하기
  
  

2. UIImagePickerControllerDelegate, UINavigationControllerDelegate 를 사용한 이미지 불러오기


    2_1. extension을 이용한 코드 분리하기
  
  
---
#### 소스코드

1. 텍스트 필드 Delegate 사용하기 예제
```swift
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
```
2. UIImagePickerControllerDelegate, UINavigationControllerDelegate 를 사용한 이미지 불러오기
```swift
    class ImagePickerViewController : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
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
```
2_1. extension을 이용한 코드 분리하기
```swift
  // MARK:- 이미지피커컨트롤러 메소드 -> 점프바에 분리된 메소드를 나누어서 
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
```




    

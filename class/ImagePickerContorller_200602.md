# UIImagePickerContorller

```swift
//
//  ViewController.swift
//  ImagePickerControllerExample
//
//  Created by giftbot on 2020. 6. 1..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit
import MobileCoreServices

final class ViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    
    private let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    // MARK: Action
    
    // 앨범을 눌렀을때
    @IBAction private func pickImage(_ sender: Any) {
        print("\n---------- [ pickImage ] ----------\n")
        
        // 소스 타입 설정
        imagePicker.sourceType = .photoLibrary // or .savedPhotoLibrary
        present(imagePicker, animated: true)
    }
    
    // 카메라를 눌렀을때
    @IBAction private func takePicture(_ sender: Any) {
        print("\n---------- [ takePicture ] ----------\n")
        // 소스 타입 확인 후 설정
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {return}
        imagePicker.sourceType = .camera
        // 미디어 타입 설정
        imagePicker.mediaTypes = [kUTTypeImage, kUTTypeMovie] as [String]
        // image만 할꺼면           [kUTTypeImage as String]
        present(imagePicker, animated: true)
    }
    
    @IBAction private func takePictureWithDelay(_ sender: Any) {
        print("\n---------- [ takePictureWithDelay ] ----------\n")
    }
    
    
    @IBAction private func recordingVideo(_ sender: Any) {
        print("\n---------- [ recordingVideo ] ----------\n")
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {return}
        imagePicker.sourceType = .camera
        imagePicker.mediaTypes = [kUTTypeMovie as String]
        // Movie - 소리 포함 vedio - 영상만
        imagePicker.cameraCaptureMode = .video
        // 초기 화면에서 이미지 찍을건지 동영상 찍을껀지
        imagePicker.cameraDevice = .front // .rear
        // 앞인지 뒤인지
    }
    
    @IBAction private func toggleAllowsEditing(_ sender: Any) {
        print("\n---------- [ toggleAllowsEditing ] ----------\n")
        imagePicker.allowsEditing.toggle()
    }
    
    
}
// MARK: - UIImagePickerController
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // import MobileCoreServices
    // var imageView: UIImageView
    // imagePicker.delegate = self
    
    // 앨범에서 이미지를 선택했을때 or 카메라에서 사진을 찍고 use를 했을때
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[.mediaType] as! NSString
        if UTTypeEqual(mediaType, kUTTypeImage) {
            let originalImage = info[.originalImage] as! UIImage
            let editedlImage = info[.editedImage] as? UIImage
            let selectedImage = editedlImage ?? originalImage
            imageView.image = selectedImage
            
            // 이미지와 영상 저장
            if picker.sourceType == .camera {
                UIImageWriteToSavedPhotosAlbum(selectedImage, nil, nil, nil)
            } else if UTTypeEqual(mediaType, kUTTypeMovie) {
                if let mediaPath = (info[.mediaURL] as? NSURL)?.path, UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(mediaPath) {
                    UISaveVideoAtPathToSavedPhotosAlbum(mediaPath, nil, nil, nil)
                }
            }
        }
        picker.dismiss(animated: true)
    }
}


// MARK: - Info.plist
// + Privacy - Camera Usage Description
// + Privacy - Microphone Usage Description
// + Privacy - Photo Library Additions Usage Description

```


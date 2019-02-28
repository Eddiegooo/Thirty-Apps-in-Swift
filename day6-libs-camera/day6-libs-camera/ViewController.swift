//
//  ViewController.swift
//  day6-libs-camera
//
//  Created by FQL on 2019/2/28.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let vur = UIBlurEffect(style: .prominent)
        let vurView = UIVisualEffectView(effect: vur)
        vurView.frame = self.view.frame
        self.view.addSubview(vurView)
        
        self.view.addSubview(self.backImage)
        self.view.addSubview(self.saveBtn)
        self.view.addSubview(self.systemLibBtn)

    }

    //MARK: 保存图片 必须先获取权限 NSPhotoLibraryAddUsageDescription
    @objc func saveImageToSystemLib() {
        savePhotoToLibrary(image: self.backImage.image!)
    }
    
    
    //保存图片到本地相册
    func savePhotoToLibrary(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveImage(image:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @objc func saveImage(image: UIImage, didFinishSavingWithError: NSError?,contextInfo: AnyObject) {
        if didFinishSavingWithError != nil {
            print("\(String(describing: didFinishSavingWithError))")
        }else{
            print("保存图片成功")
            let alertVC = UIAlertController(title: "NOTICE", message: "亲亲 保存图片成功了呢", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
                alertVC.dismiss(animated: true, completion: nil)
            }
            alertVC.addAction(action)
            self.present(alertVC, animated: true, completion: nil)
        }
    }

    //MARK：导入系统相册图片
    @objc func inputSystemLibImage() {
        choosePhotoWithType(type: .photoLibrary)
    }
    
    func choosePhotoWithType(type: UIImagePickerController.SourceType) -> Void {
        if UIImagePickerController.isSourceTypeAvailable(type) {
            let picker = UIImagePickerController.init()
            picker.delegate = self
            picker.sourceType = type
            self.present(picker, animated: true, completion: nil)
        }else if type == UIImagePickerController.SourceType.photoLibrary {
            print("相册不可用")
        }else if type == UIImagePickerController.SourceType.camera {
            print("不可以使用相机哦")
            let alertVC = UIAlertController(title: "NOTICE", message: "亲亲 不可以使用相册相机的呢", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
                alertVC.dismiss(animated: true, completion: nil)
            }
            alertVC.addAction(action)
            self.present(alertVC, animated: true, completion: nil)
        }
        
    }
    
    //MARK: Init
    lazy var backImage : UIImageView = {
        let img = UIImageView(frame: CGRect(x: 20, y: 80, width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.width))
        img.image = UIImage(named: "pic5")
        return img
    }()

    lazy var saveBtn : UIButton = {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 20, y: UIScreen.main.bounds.width + 140, width: UIScreen.main.bounds.width / 2 - 80, height: 35)
        btn.setTitle("save", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor.yellow
        btn.addTarget(self, action: #selector(saveImageToSystemLib), for: .touchUpInside)
        return btn
    }()
    
    lazy var systemLibBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.width + 140, width: UIScreen.main.bounds.width/2 - 80, height: 35)
        btn.setTitle("input", for: .normal)
        btn.setTitleColor(.red, for: .normal)
        btn.backgroundColor = UIColor.white
        btn.addTarget(self, action: #selector(inputSystemLibImage), for: .touchUpInside)
        return btn
    }()
    
}

//TODO: 多找选择图片
//这里只能单选图片， 多找怎么处理？？？？

extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //选择图片完成
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //这个key 找了半天。。
        let image:UIImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        // 拍照
        if picker.sourceType == UIImagePickerController.SourceType.camera {
            savePhotoToLibrary(image: image)
        }
        
        self.backImage.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}

//
//  ViewController.swift
//  day7-SimpleCamera
//
//  Created by FQL on 2019/3/4.
//  Copyright © 2019 FQL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(self.sepButton)
        self.view.addSubview(self.cameraImage)
        self.view.addSubview(self.leftV)
    }

    
    //MARK : Events
    @objc func outputCamera() {
        UIView.animate(withDuration: 0.35) {
            self.leftV.frame = CGRect(x: 0, y: 0, width: 300, height: self.view.frame.height)
        }
    }
    
    func hiddenLeftView() -> Void {
        UIView.animate(withDuration: 0.35) {
            self.leftV.frame = CGRect(x: -300, y: 0, width: 300, height: self.view.frame.height)
        }
    }
    
    //获取图片或是相机
    func getImageFromSomeWhere(index: Int) -> Void {
        let imagePickVC = UIImagePickerController.init()
        imagePickVC.allowsEditing = true
        if index == 1 {
            imagePickVC.sourceType = .camera
        } else {
            imagePickVC.sourceType = .photoLibrary
        }
        imagePickVC.delegate = self
        self.present(imagePickVC, animated: true, completion: nil)
    }
    
    
    //MARK: init
    
    lazy var sepButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 0, y: 100, width: 40, height: 40)
        btn.setImage(UIImage(named: "btn"), for: .normal)
        btn.addTarget(self, action: #selector(outputCamera), for: .touchUpInside)
        return btn
    }()
    
    
    lazy var cameraImage: UIImageView = {
        let imgView = UIImageView(frame: CGRect(x: 50, y: 150, width: self.view.frame.width - 80, height: self.view.frame.height - 150))
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    
    lazy var leftV : leftVIew = {
        let view = leftVIew(frame: CGRect(x: -300, y: 0, width: 300, height: self.view.frame.height))
        //MARK : swift 闭包里应该用weakself 吧
        /**
         这块闭包里的弱引用不太会， 查找资料显示：如果self可能为nil， 就用weak self；
         g如果self不会为nil， 用【unowned self】。
         */
        view.cameraBlock = { [weak self] in
            self?.getImageFromSomeWhere(index: 1)
            self!.hiddenLeftView()
        }
        view.libsBlock = { [unowned self] in
            self.getImageFromSomeWhere(index: 0)
            self.hiddenLeftView()
        }
        return view
    }()

}


//MARK: Extening
extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image: UIImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        if picker.sourceType == .camera {
            UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveImage(image:didFinishSavingWithError:contextInfo:)), nil)
            self.cameraImage.image = image
        }else {
            self.cameraImage.image = image
        }
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @objc func saveImage(image:UIImage,didFinishSavingWithError error:NSError?,contextInfo:AnyObject){
        if (error != nil) {
            print("保存失败了")
        }else {
            print("保存成功了")
        }
    }
    
}

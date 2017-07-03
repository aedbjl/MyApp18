//
//  ViewController.swift
//  MyApp18
//
//  Created by iii-user on 2017/7/3.
//  Copyright © 2017年 iii-user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let fmgr = FileManager.default
    let docDir = NSHomeDirectory() + "/Documents"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func test1(_ sender: Any) {
        let url = URL(string: "https://img.technews.tw/wp-content/uploads/2014/03/android-vs-ios.jpg")
        let req = URLRequest(url:url!)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: req, completionHandler: {(data,resp,error)in
            if error == nil {
                print("download Ok")
                self.saveFile(data: data!)
                self.showImage(data: data!)
            }else{
                print("download fail")
            }
        
        
        })
        task.resume()
    }
    
    private func saveFile(data:Data){
        let imgFile = docDir + "/apple.jpg"
        let url = URL(fileURLWithPath: imgFile)
        do{
            try data.write(to: url)
            print("save ok")
        }catch{
            print(error)
        }
    }
    private func showImage(data: Data){
        let img = UIImage(data: data)
        DispatchQueue.main.async {
            self.imageView.image = img
        }
        
    }
    
    @IBAction func test2(_ sender: Any) {
    }
    
    @IBAction func test3(_ sender: Any) {
    }
    
    @IBAction func test4(_ sender: Any) {
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(docDir)
        // Do any additional setup after loading the view, typically from a nib.
    }

    

}


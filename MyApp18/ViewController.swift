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
    
    var ai:UIActivityIndicatorView?
    
    @IBOutlet weak var webView: UIWebView!
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
        //1.
//        let img = UIImage(data: data)
//        DispatchQueue.main.async {
//            self.imageView.image = img
//        }
        //2.
        let imgFile = docDir + "/apple.jpg"
        if fmgr.fileExists(atPath: imgFile){
            let img = UIImage(contentsOfFile: imgFile)
            
            DispatchQueue.main.async {
                self.imageView.image = img
            }
        }
        
    }
    
    @IBAction func test2(_ sender: Any) {
    }
    
    @IBAction func test3(_ sender: Any) {
        
        ai = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        ai?.frame = CGRect(x: 200, y: 200, width: 100, height: 100)
        ai?.startAnimating()
        view.addSubview(ai!)
        
        // test SourceTree commit.....
        
        let url = URL(string: "http://pdfmyurl.com/?url=http://tw.yahoo.com")
        let req = URLRequest(url: url!)
        webView.loadRequest(req)
        let session = URLSession(configuration: .default)
        let task = session.downloadTask(with: req, completionHandler: {(url,resp,error)in
            if error == nil {
                print("ok")
                
                DispatchQueue.main.async {
                    self.ai?.removeFromSuperview()
                }
                
                
                self.savePDF(url:url!)
            }
        })
        
        task.resume()
        
    }
    private func savePDF(url:URL){
        
        
        
        
        let newpdf = docDir + "/yahoo.pdf"
        
        let target = URL(fileURLWithPath: newpdf)
        do{
            try fmgr.copyItem(at: url, to: target)
        }catch{
            print(error)
        }
        
    }
    
    @IBAction func test4(_ sender: Any) {
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(docDir)
        // Do any additional setup after loading the view, typically from a nib.
    }

    

}


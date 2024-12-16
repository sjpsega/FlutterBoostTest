//
//  ViewController.swift
//  FlutterBoostTest
//
//  Created by sjp on 2024/12/13.
//

import UIKit
import flutter_boost

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        button.setTitle("Open Flutter Main Page", for: .normal)
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func buttonTap(){
        let options = FlutterBoostRouteOptions()
        options.pageName = "mainPage"
        options.arguments = ["data" :"data from Native"]

        //页面是否透明（用于透明弹窗场景），若不设置，默认情况下为true
        options.opaque = true

        //这个是push操作完成的回调，而不是页面关闭的回调！！！！
        //该回调不会执行，因为 FlutterBoostPlugin popRouteParam 中，completion 被默认添加，故自己自行添加的无效
        options.completion = { completion in
            print("open operation is completed")
        }

        //这个是页面关闭并且返回数据的回调，回调实际需要根据您的Delegate中的popRoute来调用
        options.onPageFinished = { dic in
            print("onPageFinished callback data: \(dic ?? [:])")
        }

        FlutterBoost.instance().open(options)
    }
}


//
//  ViewController.swift
//  AlamofireLatestGet
//
//  Created by Nikhil Balne on 03/05/20.
//  Copyright © 2020 Nikhil Balne. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    var postsArray = [PostsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makePostsServiceCall()
    }

    func makePostsServiceCall(){
        AF.request("\(baseUrl)posts").response {
            response in
            if (response.response?.statusCode == 200){
                if let data = response.data{
                    do {
                        let userResponse = try JSONDecoder().decode([PostsModel].self, from: data)
                        self.postsArray.append(contentsOf: userResponse)
                        print("Result:\(userResponse)")
                    } catch let err {
                        print("Error:\(err.localizedDescription)")
                    }
                }
            } else {
                print("StatusCode:\(response.response!.statusCode)")
            }
            
        }
    }

}


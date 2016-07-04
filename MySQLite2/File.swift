//
//  ViewController.swift
//  SwiftInAction-006-002
//
//  Created by zhihua on 14-7-8.
//  Copyright (c) 2014年 ucai. All rights reserved.
//

import UIKit

class File: UIViewController {
    @IBAction func save(sender: AnyObject) {
        saveUser()
    }
    @IBAction func dddddd(sender: AnyObject) {
        initUser()
    }
    var db:SQLiteDB!
    
    @IBOutlet var txtUname:UITextField!
    @IBOutlet var txtMobile:UITextField!
    @IBOutlet weak var x: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20))")
        //如果有数据则加载
        initUser()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func saveUser() {
        let uname = self.txtUname.text!
        let mobile = self.txtMobile.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into t_user(uname,mobile) values('\(uname)','\(mobile)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
    }
    
       //从SQLite加载数据
    func initUser()
    {
        let data = db.query("select * from user")
        /*if data.count > 0
        {
            //获取最后一行数据显示
            let user = data[data.count - 1] as SQLRow
            txtUname.text = user["uname"]?.asString()
            txtMobile.text = user["mobile"]?.asString()
        }*/
        for var i=1;i<data.count;i=i+1
        {
            var user=data[i]
            x.text! += "\(i)"
            //x.text! += "用户名 :" + String(user[uname]!) + "\n"
            x.text! += "用户名 ：" + String(user["uname"]!) + "\n"
            
            
            
        
        
        
        }
    }
    
    
}


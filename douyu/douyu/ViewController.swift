//
//  ViewController.swift
//  douyu
//
//  Created by jyb on 16/2/29.
//  Copyright © 2016年 jyb. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var userDict: NSDictionary!
    var coinDict: NSDictionary!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //设置列表的坐标、宽高以及样式 storyboard设置
        //组织一下第二个段落的数据，封装到字典
        userDict = ["蔡老师": "昵称", "tyhcyb@126.com": "邮箱", "17710167028": "手机", "1760322478": "QQ", "123456": "密码"]
        //组织一下第三个段落的数据，封装到字典
        coinDict = ["100000": "鱼丸", "100": "鱼翅"]
    }
    
    //设定列表有多少个段落
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    //设定每个段落有多少行
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (0 == section) {
            return 1
        } else if (1 == section) {
            return 5
        } else if (2 == section) {
            return 2
        }
        return 0
    }
    
    //设定每个段落的头视图的高度
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    //设定每个段落的尾视图的高度
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if (2 == section) {
            return 10
        }
        return 0
    }
    
    //设定每个段落每个行的高度
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if (0 == indexPath.section) {
            return 70
        }
        return 50
    }
    
    //设定列表每个单元格的样式
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //设定复用cell的标示符
        let cellID = "JKCellID"
        //从复用池根据标示符取出cell
        var cell = tableView.dequeueReusableCellWithIdentifier(cellID)
        //如果取出cell为空我们自己创建一个cell，并设定cell的样式，而且给cell进行标记
        if (nil == cell) {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: cellID)
        }
        //设定第一段的cell的样式
        if (0 == indexPath.section) {
            cell?.textLabel?.text = "头像"
            let size = UIScreen.mainScreen().bounds.size
            let imageV = UIImageView(frame: CGRectMake(size.width - 60, 10, 50, 50))
            imageV.image = UIImage(named: "userLogo")
            cell?.contentView.addSubview(imageV)
        } else if(1 == indexPath.section) {
            //设定第二段的cell的样式
            if let key = userDict.allKeys[indexPath.row] as? String{
                cell?.textLabel?.text = key
                cell?.detailTextLabel?.text = key
                cell?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            }
        } else if (2 == indexPath.section) {
            //设定第三段的cell的样式
            if let key = coinDict.allKeys[indexPath.row] as? String{
                cell?.textLabel?.text = key
                cell?.detailTextLabel?.text = key
            }
        }
        return cell!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


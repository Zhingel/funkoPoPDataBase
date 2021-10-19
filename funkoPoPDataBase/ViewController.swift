//
//  ViewController.swift
//  funkoPoPDataBase
//
//  Created by Стас Жингель on 19.10.2021.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    let funkoCollection = loadCSV(from: "funko_pop")
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: self.view.bounds, style: UITableView.Style.plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
                
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }


}



extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        funkoCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = funkoCollection[indexPath.row].title
        let image = funkoCollection[indexPath.row].imageName.replacingOccurrences(of: "https://www.hobbydb.com/", with: "https://images.hobbydatabase.com/")
        let url = URL(string: image)
        cell.imageView?.sd_setImage(with: url, completed: nil)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}

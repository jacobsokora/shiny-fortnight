//
//  ViewController.swift
//  Colors
//
//  Created by Jacob Sokora on 7/6/18.
//  Copyright © 2018 Jacob Sokora. All rights reserved.
//

import UIKit

class ColorsTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var colorNames: [String] = ["red", "orange", "yellow", "green", "blue", "purple", "brown"]
    var colors: [UIColor] = [.red, .orange, .yellow, .green, .blue, .purple, .brown]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ColorsTableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        cell.textLabel?.text = colorNames[indexPath.row]
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
}

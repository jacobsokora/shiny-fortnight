//
//  ViewController.swift
//  Colors
//
//  Created by Jacob Sokora on 7/6/18.
//  Copyright © 2018 Jacob Sokora. All rights reserved.
//

import UIKit

struct Color {
    let name: String
    let color: UIColor
}

class ColorsTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let colors = [
        Color(name: "Red", color: .red),
        Color(name: "Orange", color: .orange),
        Color(name: "Yellow", color: .yellow),
        Color(name: "Green", color: .green),
        Color(name: "Blue", color: .blue),
        Color(name: "Purple", color: .purple),
        Color(name: "Brown", color: .brown)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ColorViewController {
            destination.color = colors[tableView.indexPathForSelectedRow?.row ?? 0]
        }
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
        cell.textLabel?.text = colors[indexPath.row].name
        cell.backgroundColor = colors[indexPath.row].color
        return cell
    }
}

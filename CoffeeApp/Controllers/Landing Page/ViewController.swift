//
//  ViewController.swift
//  CoffeeApp
//
//  Created by Mac-OBS-18 on 17/01/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let url = URL(string: "https://api.sampleapis.com/coffee/hot")
    
    var coffee: [Coffee]?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(UINib(nibName: "CoffeeListTableViewCell", bundle: nil),
                                forCellReuseIdentifier: "CoffeeListTableViewCell")
//        self.getData(url!)
        self.getCoffeeDetails()
    }

    // MARK: - Network Request
    
    private func getCoffeeDetails() {
        let request = GetCoffeeNetworkRequest.init()
        NetworkManager.execute(request: request, responseType: [Coffee].self) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                self.coffee = data
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - UITableViewDelegate & UITableViewDataSource
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffee?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeListTableViewCell", for: indexPath) as? CoffeeListTableViewCell else {
            return UITableViewCell()
        }
        if let coffeeData = coffee?[indexPath.row].title {
            cell.cellLabel.text = coffeeData
            guard let url = coffee?[indexPath.row].image else {
                return UITableViewCell()
            }
            cell.cellImage.loadImage(urlString: url)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {

        let myViewController = CoffeeDetailViewController(nibName: "CoffeeDetailViewController", bundle: nil)
        myViewController.coffeeName = coffee?[indexPath.row].title ?? ""
        myViewController.coffeeDescription = coffee?[indexPath.row].description ?? ""
        myViewController.coffeeImage = coffee?[indexPath.row].image ?? ""

        navigationController?.pushViewController(myViewController, animated: true)
    }


}

// MARK: - To convert URL to Image

extension UIImageView {
    func loadImage(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}




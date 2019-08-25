//
//  ChartViewController.swift
//  grafica-satisfaccion
//
//  Created by  Jose  Santiago on 8/25/19.
//  Copyright © 2019  Jose  Santiago. All rights reserved.
//

import UIKit
import Charts

class ChartViewController: UITableViewController {
    
    // MARK: Variables
    
    var colors: [String] = []
    var questions: [Question] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadChartData()
    }
    
    // MARK: Methods
    
    func loadChartData() {
        guard let urlString = URL(string: ApiUrls.chartData) else {
            ErrorPresenter.showError(message: ErrorMessages.genericErrorMessage, on: self)
            return
        }
        
        var urlRequest = URLRequest(url: urlString)
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        URLSession.shared.dataTask(with: urlRequest) {(data, response, err) in
            guard let datum = data else { return }
            do {
                let apiData = try JSONDecoder().decode(ApiResponse.self, from: datum)
                self.colors = apiData.colors
                self.questions = apiData.questions
            } catch let error {
                ErrorPresenter.showError(message: ErrorMessages.genericErrorMessage, on: self)
            }
        }.resume()
    }
    
}

// MARK: Table View Data Setting

extension ChartViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(questions.count)
        return questions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PieChartCell", for: indexPath) as! PieChartTableViewCell
        cell.question = questions[indexPath.row]
        cell.colors = colors
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400.0;
    }
}

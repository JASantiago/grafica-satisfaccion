//
//  PieChartTableViewCell.swift
//  grafica-satisfaccion
//
//  Created by  Jose  Santiago on 8/25/19.
//  Copyright © 2019  Jose  Santiago. All rights reserved.
//

import UIKit
import Charts

class PieChartTableViewCell: UITableViewCell {
    
    // MARK: Outlets

    @IBOutlet weak var pieChartView: PieChartView!
    
    // MARK: Variables
    var question: Question? {
        didSet {
            loadData()
        }
    }
    var colors: [String] = [] {
        didSet {
            loadColors()
        }
    }
    
    var castedColors: [UIColor] = []
    var charDataEntries = [PieChartDataEntry]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func loadData() {
        charDataEntries = []
        for data in question?.chartData ?? [] {
            charDataEntries.append(PieChartDataEntry(value: Double(data.percetnage), label: data.text))
        }

        let chartDataSet = PieChartDataSet(entries: charDataEntries, label: nil)
        chartDataSet.colors = castedColors
        let chartData = PieChartData(dataSet: chartDataSet)
        pieChartView.data = chartData
    }
    
    func loadColors() {
        for color in colors {
            castedColors.append(UIColor(hexString: color))
        }
        
        let chartDataSet = PieChartDataSet(entries: charDataEntries, label: nil)
        chartDataSet.colors = castedColors
        let chartData = PieChartData(dataSet: chartDataSet)
        pieChartView.data = chartData
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

// MARK: Color Helper
extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

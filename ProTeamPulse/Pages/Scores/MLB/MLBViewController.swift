//
//  MLBViewController.swift
//  ProTeamPulse
//
//  Created by Sam Zack on 8/24/23.
//

import UIKit

class MLBViewController: UIViewController {
    
    var currentDate: Date = Date() {
        didSet {
            updateDateControlLabel()
        }
    }
    
    private let dateControlLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.alpha = 0.8
        return label
    }()
    
    private let nextDayButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        button.tintColor = .black
        button.addTarget(MLBViewController.self, action: #selector(nextDayButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    private let dayBeforeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = .black
        button.addTarget(MLBViewController.self, action: #selector(dayBeforeButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDateControlLabel()
        view.addSubview(nextDayButton)
        view.addSubview(dayBeforeButton)
        
        nextDayButton.frame = CGRect(x: self.view.bounds.width - 25, y: 50, width: 20, height: 20)
        dayBeforeButton.frame = CGRect(x: 10, y: 50, width: 20, height: 20)
        
        dateControlLabel.frame = CGRect(x: self.view.bounds.width / 2 - (self.view.bounds.width / 2), y: 45, width: self.view.bounds.width, height: 30)
        view.addSubview(dateControlLabel)
    }
    
    @objc func nextDayButtonTapped(_ sender: UIButton) {
        currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate) ?? currentDate
    }
    
    @objc func dayBeforeButtonTapped(_ sender: UIButton) {
        currentDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate) ?? currentDate
    }
    
    private func updateDateControlLabel() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let dateString = dateFormatter.string(from: currentDate)
        dateControlLabel.text = dateString
    }
}


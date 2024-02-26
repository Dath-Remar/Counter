//
//  ViewController.swift
//  Counter
//
//  Created by Сергей Балакирев on 25.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayCounter: UILabel!
    @IBOutlet weak var incrementButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var decrementButton: UIButton!
    
    @IBOutlet weak var changesHistoryTextView: UITextView!
    
    
    var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialHistoryText()
        changesHistoryTextView.isScrollEnabled = true
        changesHistoryTextView.isEditable = false       
        updateCounterLabel()
    }
    
    
    @IBAction func tapIncrementButton(_ sender: Any) {
        counter += 1
        updateCounterLabel()
        appendToHistory(change: 1)
    }

    @IBAction func tapDecrementButton(_ sender: Any) {
        if counter > 0 {
                    counter -= 1
                    updateCounterLabel()
                    appendToHistory(change: -1)
                } else {
                    appendToHistoryAttemptBelowZero()
                }
    }
    
    @IBAction func tapResetButton(_ sender: Any) {
        counter = 0
                updateCounterLabel()
                appendToHistoryReset()
            }
    
    

    func updateCounterLabel() {
        displayCounter.text = "Значение счётчика: \(counter)"
    }
    func setupInitialHistoryText() {
            changesHistoryTextView.text = "История изменений:"
        }
    func appendToHistory(change: Int) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let dateString = dateFormatter.string(from: Date())
        changesHistoryTextView.text.append("\n\(dateString): значение изменено на \(change)")
        scrollToBottom()
    }
    func appendToHistoryAttemptBelowZero() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let dateString = dateFormatter.string(from: Date())
        changesHistoryTextView.text.append("\n\(dateString): попытка уменьшить значение счётчика ниже 0")
        scrollToBottom()
    }
    func appendToHistoryReset() {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
            let dateString = dateFormatter.string(from: Date())
            changesHistoryTextView.text.append("\n\(dateString): значение сброшено")
            scrollToBottom()
        }
    
    func scrollToBottom() {
            let bottom = NSMakeRange(changesHistoryTextView.text.count - 1, 1)
            changesHistoryTextView.scrollRangeToVisible(bottom)
        }
    
}


//
//  ViewController.swift
//  Silly Song
//
//  Created by HhhotDog on 16/5/28.
//  Copyright © 2016年 Alexscott. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }

    @IBAction func reset(){
        nameField.text = ""
        lyricsView.text = ""
    }
    
    @IBAction func displayLyrics(){
        lyricsView.text = lyricsForName(bananaFanaTemplate, fullName: nameField.text!)
    }
    
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}


let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joinWithSeparator("\n")

func shortNameFromName(fullName: String) -> String {
    let shortName = fullName.lowercaseString
    let vowelsSet = NSCharacterSet(charactersInString: "aeiou")
    if let range = shortName.stringByFoldingWithOptions(.DiacriticInsensitiveSearch, locale: nil).rangeOfCharacterFromSet(vowelsSet) {
        return shortName.substringFromIndex(range.startIndex)
    }
    return shortName
    
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String{
    let shortName = shortNameFromName(fullName)
    let lyrics = lyricsTemplate.stringByReplacingOccurrencesOfString("<FULL_NAME>", withString: fullName).stringByReplacingOccurrencesOfString("<SHORT_NAME>", withString: shortName)
    return lyrics
}














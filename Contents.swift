
//: Playground - noun: a place where people can play
// how to encode and decode model objects

//: Playground - noun: a place where people can play
// how to encode and decode model objects

import UIKit
import Foundation

var str = "Hello, playground"

class Note: NSObject,NSCoding {
    let title: String
    let text: String
    let timestamp: Date
    
    init(title:String, text: String, timestamp: Date){
        self.title = title
        self.text = text
        self.timestamp = timestamp
    }
    
    // impl NSCoding protocol
    func encode(with aCoder: NSCoder){
        aCoder.encode(title, forKey: "title")
        aCoder.encode(text, forKey: "text")
        aCoder.encode(timestamp, forKey: "timestamp")
    }
    
    // This is convinience initializer
    // impl NSCoding protocol
    convenience required init?(coder aDecoder: NSCoder) {
        
        guard let title = aDecoder.decodeObject(forKey: "title") as? String,
            let text = aDecoder.decodeObject(forKey: "text") as? String,
            let timestamp = aDecoder.decodeObject(forKey: "timestamp") as? Date else {
                return nil }
        self.init(title: title, text: text, timestamp: timestamp)
    }
    
    override var description: String {
        return "Note(title: \"\(title)\")"
    }
}

let note = Note(title: "My first note", text: "Notes are valuable", timestamp: Date())
let archivedNote = NSKeyedArchiver.archivedData(withRootObject: note)
print("\(note)")
NSKeyedUnarchiver.unarchiveObject(with: archivedNote) as? Note

// The 4 lines below doesn't work in Playground
var documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask).first!
print("\(documentDirectory)")
let archiveURL = documentDirectory.appendingPathComponent("notes")
print("\(archiveURL)")

// This works in Playground in XCode8
let archivedNote2 = NSKeyedArchiver.archiveRootObject(note, toFile: "nnn")
let unarchvedNote = NSKeyedUnarchiver.unarchiveObject(withFile: "nnn") as? Note

let note1 = Note(title: "My first note", text: "Notes are valuable", timestamp: Date())
let note2 = Note(title: "My second note", text: "Notes are valuable", timestamp: Date())
let note3 = Note(title: "My third note", text: "Notes are valuable", timestamp: Date())

var notes = [note1, note2, note3]
let archivedNotes = NSKeyedArchiver.archiveRootObject(notes, toFile: "notes")
let unarchvedNotes = NSKeyedUnarchiver.unarchiveObject(withFile: "notes") as? [Note]




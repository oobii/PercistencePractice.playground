# PercistencePractice.playground - Making objects percistent arcoss App launches

One of the ways needs implementing NSCoding protocol - how to encode and decode model objects and saving into a file

NSCoder is an old mechanism, All objects has to implement ```encode(with aCoder: NSCoder)``` and ```init(coder: NSCoder)```
We take object graph and turn it into Data using ```NSKeyedArchiver``` then write it into a file, then read from that file, and  turn Data into object graph using 
```NSKeyedUnarchiver```

<b>Codable</b> is the new mechanism

Some standard types are automatically Coadable by Swift, otherwise you have to implement Codable for the object, see Stanford 
Lecture 13 slides of iOS 11

You make you data type Codable easily if your vars are Cadable!

Another way is <b>Core Data</b>



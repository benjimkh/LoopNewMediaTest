//
//  MockData.swift
//  LoopNewMedia
//
//  Created by Benyamin Mokhtarpour on 9/19/20.
//  Copyright © 2020 BenyaminMokhtarpour. All rights reserved.

import UIKit

class MockDataSource {
    
    static let mockReviews: [Review] = [
        Review(userName: "Benyamin Mokhtarpour",color: UIColor.randomColor(), rating: randomRate(), time: "1 hour ago", desc: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
        Review(userName: "Kason Woodcock",color: UIColor.randomColor(), rating: randomRate(), time: "2 hour ago", desc: "when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting"),
        Review(userName: "Benyamin Mokhtarpour",color: UIColor.randomColor(), rating: randomRate(), time: "2 hour ago", desc: "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
        Review(userName: "Benyamin Mokhtarpour",color: UIColor.randomColor(), rating: randomRate(), time: "Yesterday", desc: "It is a long established fact that a reader will be distracted by the readable content of a page"),
        Review(userName: "Benyamin Mokhtarpour",color: UIColor.randomColor(), rating: randomRate(), time: "3 hour age", desc: "It is a long established fact that a reader will be distracted by the readable content of a page"),
        Review(userName: "Benyamin Mokhtarpour",color: UIColor.randomColor(), rating: randomRate(), time: "A week ago", desc: "It is a long established fact that a reader will be distracted by the readable content of a page"),
        Review(userName: "Benyamin Mokhtarpour",color: UIColor.randomColor(), rating: randomRate(), time: "Last month", desc: "The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text"),
        Review(userName: "Benyamin Mokhtarpour",color: UIColor.randomColor(), rating: randomRate(), time: "1 hour ago", desc: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
        Review(userName: "Kason Woodcock",color: UIColor.randomColor(), rating: randomRate(), time: "2 hour ago", desc: "when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting"),
        Review(userName: "Benyamin Mokhtarpour",color: UIColor.randomColor(), rating: randomRate(), time: "2 hour ago", desc: "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
        Review(userName: "Benyamin Mokhtarpour",color: UIColor.randomColor(), rating: randomRate(), time: "Yesterday", desc: "It is a long established fact that a reader will be distracted by the readable content of a page"),
        Review(userName: "Benyamin Mokhtarpour",color: UIColor.randomColor(), rating: randomRate(), time: "3 hour age", desc: "It is a long established fact that a reader will be distracted by the readable content of a page"),
        Review(userName: "Benyamin Mokhtarpour",color: UIColor.randomColor(), rating: randomRate(), time: "A week ago", desc: "It is a long established fact that a reader will be distracted by the readable content of a page"),
        Review(userName: "Benyamin Mokhtarpour",color: UIColor.randomColor(), rating: randomRate(), time: "Last month", desc: "The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text"),
        Review(userName: "Benyamin Mokhtarpour",color: UIColor.randomColor(), rating: randomRate(), time: "1 hour ago", desc: "The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text"),
        Review(userName: "Benyamin Mokhtarpour",color: UIColor.randomColor(), rating: randomRate(), time: "2 hour ago", desc: "The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text"),
        Review(userName: "Benyamin Mokhtarpour",color: UIColor.randomColor(), rating: randomRate(), time: "2 hour ago", desc: "The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text"),
        Review(userName: "Benyamin Mokhtarpour",color: UIColor.randomColor(), rating: randomRate(), time: "Yesterday", desc: "The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text"),
        Review(userName: "Benyamin Mokhtarpour",color: UIColor.randomColor(), rating: randomRate(), time: "3 hour age", desc: "The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text"),
        Review(userName: "Benyamin Mokhtarpour",color: UIColor.randomColor(), rating: randomRate(), time: "A week ago", desc: "The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text"),
        Review(userName: "Benyamin Mokhtarpour",color: UIColor.randomColor(), rating: randomRate(), time: "Last month", desc: "The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text")
    ]
    
    static let mockHorizontalItems: [Item] = [
        Item(imageName: "hImg01", title: "Horizontal Img One", subtitle: "Emilio Sawyer", desc: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", rate: Double.random(in: 0.0...5.0)),
        Item(imageName: "hImg02", title: "Horizontal Img Two", subtitle: "Farhaan Finch", desc: "the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", rate: Double.random(in: 0.0...5.0)),
        Item(imageName: "hImg03", title: "Horizontal Img Three", subtitle: "Emilio Sawyer", desc: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", rate: Double.random(in: 0.0...5.0)),
        Item(imageName: "hImg04", title: "Horizontal Img Four", subtitle: "Farhaan Finch", desc: "the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", rate: Double.random(in: 0.0...5.0)),
        Item(imageName: "hImg05", title: "Horizontal Img Five", subtitle: "Pixie Strickland", desc: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", rate: Double.random(in: 0.0...5.0)),
        Item(imageName: "hImg06", title: "Horizontal Img Six", subtitle: "Farhaan Finch", desc: "the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", rate: Double.random(in: 0.0...5.0))
    ]
    
    static let mockVerticalItems: [Item] = [
        Item(imageName: "vImg01", title: "Vertical Img One", subtitle: "Emilio Sawyer", desc: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", rate: randomRate()),
        Item(imageName: "vImg02", title: "Vertical Img Two", subtitle: "Farhaan Finch", desc: "the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", rate: randomRate()),
        Item(imageName: "vImg03", title: "Vertical Img Three", subtitle: "Emilio Sawyer", desc: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", rate: randomRate()),
        Item(imageName: "vImg04", title: "Vertical Img Four", subtitle: "Farhaan Finch", desc: "the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", rate: randomRate()),
        Item(imageName: "vImg05", title: "Vertical Img Five", subtitle: "Pixie Strickland", desc: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", rate: randomRate()),
        Item(imageName: "vImg06", title: "Vertical Img Six", subtitle: "Farhaan Finch", desc: "the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", rate: randomRate()),
        Item(imageName: "vImg07", title: "Vertical Img Seven", subtitle: "Emilio Sawyer", desc: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", rate: randomRate()),
        Item(imageName: "vImg08", title: "Vertical Img Eight", subtitle: "Farhaan Finch", desc: "the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", rate: randomRate())
    ]
    
    static let mockBannerItems: [Item] = [
        Item(imageName: "bImg01", title: "Horizontal Img One", subtitle: "Emilio Sawyer", desc: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", rate: randomRate()),
        Item(imageName: "bImg02", title: "Horizontal Img Two", subtitle: "Farhaan Finch", desc: "the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", rate: randomRate()),
        Item(imageName: "bImg03", title: "Horizontal Img Three", subtitle: "Emilio Sawyer", desc: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", rate: randomRate()),
        Item(imageName: "bImg04", title: "Horizontal Img Four", subtitle: "Farhaan Finch", desc: "the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", rate: randomRate()),
        Item(imageName: "bImg05", title: "Horizontal Img Five", subtitle: "Pixie Strickland", desc: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", rate: randomRate()),
        Item(imageName: "bImg06", title: "Horizontal Img Six", subtitle: "Farhaan Finch", desc: "the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", rate: randomRate()),
        Item(imageName: "bImg07", title: "Horizontal Img Seven", subtitle: "Emilio Sawyer", desc: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", rate: randomRate()),
        Item(imageName: "bImg08", title: "Horizontal Img Eight", subtitle: "Farhaan Finch", desc: "the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", rate: randomRate()),
        Item(imageName: "bImg09", title: "Horizontal Img Nine", subtitle: "Farhaan Finch", desc: "the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", rate: randomRate())
    ]
    
}


extension UIColor {
    static func randomColor()->UIColor{
        let colors: [UIColor] = [.red, .yellow, .brown, .darkGray, .cyan, .blue, .green, .purple, .magenta, .orange]
        return colors.randomElement()!
    }
}

fileprivate func randomRate() -> Double{
    return (String(format: "%.1f", Double.random(in: 1.0...5.0)) as NSString).doubleValue
}

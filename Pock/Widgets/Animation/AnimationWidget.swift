//
//  Animation.swift
//  Pock
//
//  Created by Matthew Tucker on 26/7/19.
//  Copyright © 2019 Pierluigi Galdi. All rights reserved.
//

import Foundation

class AnimationButtonWidget: NSButton {
    override open var intrinsicContentSize: NSSize {
        var size = super.intrinsicContentSize
        size.width = min(size.width, 64)
        return size
    }
}

class AnimationWidget: PKWidget {


    var identifier: NSTouchBarItem.Identifier = NSTouchBarItem.Identifier.animate
    var customizationLabel: String = "Animation"
    var view: NSView!
    var gifItemView: ClickableGifView!;

    required init() {

        view = NSView(frame: NSRect(x: 0, y: 0, width: 700.0, height: 30.0))
        gifItemView = ClickableGifView(frame: view.frame);
        gifItemView.initialize();
        gifItemView.action = tap

        view.addSubview(gifItemView);

//        view.wantsLayer = true;
//        view.layer!.backgroundColor = CGColor.white;
//        let gifURL: String = "https://www.storybench.org/wp-content/uploads/2015/05/NYAN_CAT.gif"

    }

    func tap() {
//        NSWorkspace.shared.notificationCenter.post(name: NSNotification.Name(rawValue: "itsMarioTime"), object: nil)

    }
}

class ClickableGifView: PKView {

    public var action: (() -> Void)!

    override func didTapHandler() {
//        self.action();

        index += 1
        setImage()
    }

    private var imgImage1: NSImageView = NSImageView();
    public var index = 0;
    public var urlConfig = [
        "https://thumbs.gfycat.com/ExhaustedSaneAngwantibo-size_restricted.gif"
//        "https://media3.giphy.com/media/GNvWw0pDL6QRW/giphy.gif?cid=790b76115d424c786a61506967ee4cd0&rid=giphy.gif"
        , "https://steamuserimages-a.akamaihd.net/ugc/959726194619824033/11FD47BB8431FE9DB8ACD6F31EF1810DF91416CD/"
    ]

    public var frames = [

        NSRect(x: 0.0, y: 0.0, width: 30.0, height: 30.0),
//        NSRect(x: 0.0, y: -30.0, width: 110.0, height: 110.0),
        NSRect(x: 0.0, y: 0.0, width: 30.0, height: 30.0),


    ]

//    public convenience init(frame: NSRect = .zero, clickAction: @escaping (() -> Void)) {
//        self.init(frame: frame, clickAction: clickAction)
//        action = clickAction;
//        initialize()
//    }

    func setImage() {
        let gifURL = urlConfig[index % urlConfig.count];
        do {
            try
            self.imgImage1.image = NSImage(data: Data(contentsOf: URL(string: gifURL)!))

            self.imgImage1.frame = frames[index % urlConfig.count];

        } catch {
            print("uh oh")
        }
    }

    func initialize() {

        let gifURL: String;
//            = "https://thumbs.gfycat.com/ExhaustedSaneAngwantibo-size_restricted.gif";

        gifURL = urlConfig[index];

        imgImage1 = NSImageView(frame: frames[index])
        imgImage1.canDrawSubviewsIntoLayer = true
        imgImage1.imageScaling = .scaleProportionallyDown
        imgImage1.animates = true

        do {
            try imgImage1.image = NSImage(data: Data(contentsOf: URL(string: gifURL)!))
            self.addSubview(imgImage1)
        } catch {
            print("uh oh")
        }

    }

}

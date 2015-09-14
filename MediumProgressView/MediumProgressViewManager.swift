//
//  MediumProgressViewManager.swift
//  MediumProgressView
//
//  Created by pixyzehn on 2/9/15.
//  Copyright (c) 2015 pixyzehn. All rights reserved.
//

import UIKit

public class MediumProgressViewManager {
    public enum Position {
        case Top
        case Bottom
    }
    
    public var position: Position
    public var color: UIColor
    public var height: CGFloat
    public var isLeftToRight: Bool
    public var duration: CFTimeInterval
    public var repeatCount: Float
    //    public var window: UIWindow?
    public var progressView: MediumProgressView?
    
    init() {
        position = .Top
        color = UIColor.blackColor()
        height = 1.0
        isLeftToRight = true
        duration = 2.0
        repeatCount = Float.infinity
    }
    
    public static let sharedInstance = MediumProgressViewManager()
    
    // MARK: function
    
    public func show() {
        guard let window = UIApplication.sharedApplication().keyWindow else { return }
        
        if progressView == nil {
            progressView = initializeViewWithFrame(window.frame)
        }
        
        if progressView?.superview == nil {
            window.addSubview(progressView!)
        }
    }
    
    public func hide() {
        progressView?.removeFromSuperview()
    }
    
    // MARK: Helpers
    
    private func initializeViewWithFrame(frame: CGRect) -> MediumProgressView? {
        let width = frame.size.width
        let height = frame.size.height
        var newFrame = CGRectZero
        
        switch position {
        case .Top:
            newFrame = CGRectMake(0, 0, width, self.height)
        case .Bottom:
            newFrame = CGRectMake(0, height - self.height, width, self.height)
        }
        
        let newProgressView = MediumProgressView(frame: newFrame,
            isLeftToRight: isLeftToRight,
            duration: duration,
            repeatCount: repeatCount)
        newProgressView.delegate = self
        newProgressView.backgroundColor = color
        
        return newProgressView
    }
    
}

extension MediumProgressViewManager: MediumProgressViewDelegate {
    func finishedAnimation() {
        hide()
    }
}

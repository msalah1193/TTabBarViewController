//
//  TTabBarViewController.swift
//  TTabBarViewController
//
//  Created by Mohamed Salah on 1/30/18.
//  Copyright © 2018 Mohamed Salah. All rights reserved.
//

import UIKit

extension UIImage{
    //Draws the top indicator by making image with filling color
    class func drawTabBarIndicator(color: UIColor, size: CGSize, onTop: Bool) -> UIImage {
        let indicatorHeight = size.height / 30
        let yPosition = onTop ? 0 : (size.height - indicatorHeight)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRect(x: 0, y: yPosition, width: size.width, height: indicatorHeight))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}

/**
    Custom UITabBarController class which draw line indicator
    with custom color above or below the selected tab bar item using
    selectionIndicatorImage property on the UITabBar class
 **/
@IBDesignable class TTabBarViewController: UITabBarController{
    /*
        color of the indicator
     */
    @IBInspectable var indicatorColor: UIColor = UIColor()
    
    /*
        determine if the indicator
        will be drawn on top of bar items or not
     */
    @IBInspectable var onTopIndicator: Bool = true
    
    
    //MARK:- View Controller Life Cycle
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // Draw Indicator above the tab bar items
        guard let numberOfTabs = tabBar.items?.count else {
            return
        }
        
        let numberOfTabsFloat = CGFloat(numberOfTabs)
        let imageSize = CGSize(width: tabBar.frame.width / numberOfTabsFloat,
                               height: tabBar.frame.height)
        
        
        let indicatorImage = UIImage.drawTabBarIndicator(color: indicatorColor,
                                                         size: imageSize,
                                                         onTop: onTopIndicator)
        self.tabBar.selectionIndicatorImage = indicatorImage
    }
    
}

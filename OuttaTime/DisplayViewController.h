//
//  DisplayViewController.h
//  OuttaTime
//
//  Created by Komari Herring on 9/21/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DateSetDelegate

- (void)dateWasChosen:(NSDate*)dateValue;


@end


@interface DisplayViewController : UIViewController


@end


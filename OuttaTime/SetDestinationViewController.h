//
//  ViewController.h
//  OuttaTime
//
//  Created by Komari Herring on 9/21/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DisplayViewController.h"

@interface SetDestinationViewController : UIViewController

@property (nonatomic) id<DateSetDelegate> delegate;

@end

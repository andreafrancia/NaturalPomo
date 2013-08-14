//
//  ViewController.h
//  NaturalPomo
//
//  Created by Andrea Francia on 8/13/13.
//  Copyright (c) 2013 Andrea Francia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Timer.h"
@interface ViewController : UIViewController<Clock, Speaker>
@property (weak, nonatomic) IBOutlet UILabel *display;

@end

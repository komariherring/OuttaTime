//
//  ViewController.m
//  OuttaTime
//
//  Created by Komari Herring on 9/21/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "SetDestinationViewController.h"

@interface SetDestinationViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *setDestinationPicker;



@end

@implementation SetDestinationViewController



- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Action Handlers

- (IBAction)cancelTapped:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

- (IBAction)setTapped:(UIButton *)sender
{
    
    [self.delegate dateWasChosen:self.setDestinationPicker.date];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}



@end

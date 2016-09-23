//
//  DisplayViewController.m
//  OuttaTime
//
//  Created by Komari Herring on 9/21/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "DisplayViewController.h"
#import "SetDestinationViewController.h"

@interface DisplayViewController () <DateSetDelegate>

{
    //variables
    
    int originalSpeed;
    
    NSNumber *currentSpeed;
    NSTimer *speedTimer;
    
}

// properties

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel2;
@property (weak, nonatomic) IBOutlet UILabel *speedLabel;
@property (weak, nonatomic) IBOutlet UILabel *destinationDateLabel;

@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@property (nonatomic, weak) NSDate *today;


@end

@implementation DisplayViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSDate *today = [NSDate date];
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
    self.dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    self.dateFormatter.timeStyle = NSDateFormatterNoStyle;
    self.dateLabel.text = [self.dateFormatter stringFromDate:today];
    
    
    originalSpeed = 0;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Action Handlers

- (IBAction)travelBackTapped:(UIButton *)sender
{
    if (!speedTimer)
    {
        speedTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(travelBackFired) userInfo:nil repeats:YES];
    }
    
}




#pragma mark - Date Set Delegate

- (void)dateWasChosen:(NSDate*)dateValue
{

    self.destinationDateLabel.text = [self.dateFormatter stringFromDate: dateValue];

}



#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"SetDestinationSegue"])
    {
        SetDestinationViewController *setDateVC = [segue destinationViewController];
        setDateVC.delegate = self;
    }
}



#pragma mark - Misc.


-(void)travelBackFired
{
    if (originalSpeed < 88)
    {
        originalSpeed = originalSpeed + 1;
        
        //have to put long
        self.speedLabel.text = [NSString stringWithFormat:@"%ld MPH", (long)originalSpeed];
    }
    
    else
    {
        originalSpeed = 0;
        
        //have to put long
        self.speedLabel.text = [NSString stringWithFormat:@"%ld MPH", (long)originalSpeed];
        self.dateLabel2.text = self.dateLabel.text;
        self.dateLabel.text = self.destinationDateLabel.text;
        self.destinationDateLabel.text = @"Pick a Destination!";
        [speedTimer invalidate];
        speedTimer = nil;
    }
    
    
}




@end

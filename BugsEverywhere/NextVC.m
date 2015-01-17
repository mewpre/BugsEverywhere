//
//  ViewControllerTwo.m
//  BugsEverywhere
//
//  Created by xcode on 1/13/15.
//  Copyright (c) 2015 MSCline. All rights reserved.
//

#import "NextVC.h"


@interface NextVC ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end


@implementation NextVC

-(void)viewDidLoad
{
    [super viewDidLoad];

    self.label.text = [NSString stringWithFormat:@"%@: %@", self.message, self.descriptor];
}


@end

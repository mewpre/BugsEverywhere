//
//  RootVC.m
//  BugsEverywhere
//
//  Created by xcode on 1/13/15.
//  Copyright (c) 2015 MSCline. All rights reserved.
//

#import "RootVC.h"
#import "ProductNumber.h"
#import "NextVC.h"


@interface RootVC () <UITableViewDataSource>

  @property NSMutableArray *dataToDisplay;
  @property int numberOfRowsInSection;
  @property (weak, nonatomic) IBOutlet UITableView *tableView;
  @property (weak, nonatomic) IBOutlet UIButton *nextButton;

@end



/*
 

A. REVIEW XCODE BUTTOM WINDOWS

 - step thru the code (it is in the learningToDebug method)
 - the comments and prompts will walk you through what everything does

B. ACTIVITY:

 - form groups of three

    1) identify the problem (eg, the table view is empty)
    2) how do we test it / track down the problem?  do we have any idea what could be going wrong?
        a) spend 90 seconds thinking about what the bug is and how you can find it
        b) spend 120 seconds discussing it will team
        c) good luck hunting
    3) find the bug and fix it
    4) write down a list of the errors and the corresponding error message

- I will walk thru the first couple bugs, advanced students/groups can continue on their own


HINTS

 did you set the delegate?
 if something is not called, check for nil values
 if not in code, then in storyboard (hard to see, so sometimes best to just re-wire)

 break out a process into individual steps, helpping to locate errors and see variables

 learn to recognize common messages
    eg, an NSRangeException is generally when iteration thru a loop
    key-value problems are often storyboard
 learn to read the call stack
 

GOOD CODE HELPS AVOID ERRORS 
(and allows flexibility - ie, you can easily make changes without introducing errors)

 
*/


@implementation RootVC


#pragma mark SETUP

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.dataToDisplay = [NSMutableArray new];

    [self getData];
    [self createShortProductNumber];
    [self.tableView reloadData];

    [self learningHowToDebug_understandingTheBottomRightAndLeftWindows];


}

-(void)learningHowToDebug_understandingTheBottomRightAndLeftWindows
{

    // the left pane shows our variables

        NSString *localVariable;
        NSString *localVariable2;

        localVariable = @"your variables will show up in your bottom left window";
        localVariable2 = @"Don't forget about me!";

        self.exampleOfInstanceVariable = @"After you guys are all gone, I will still be here.";

    // the right window pane

        NSLog(@"\n\nUNDERSTANDING THE RIGHT WINDOW PANE:\n 1) shows logs (a great way to get data if don't want to break the program flow or are in a loop)\n2) shows error messages \n3) shows call stack\n* can also access variable (type po localVariable)");

    // remove code, here I just wanted to force it to crash/exit

        // code tip: you can call a method after a time delay using perform selector
        // in this case, since the method does not exit, it will crash
       // [self performSelector:@selector(callAMethodThatDoesNotExistHere) withObject:nil afterDelay:0];


}

-(void)getData
{

    // todo: pull data from online

    // make sample data
    for(int x = 0; x<11; x++)
    {

        ProductNumber *product = [ProductNumber new];
        product.productNumber = [NSString stringWithFormat:@"product number: %i", x];
        [self.dataToDisplay addObject:product];

    }

}

-(void)createShortProductNumber
{

    // product numbers, eg, 00000112334-000012555, use zeores as placeholders
    // remove the zeroes for our end users and store in productNumberShort property

    // for each product number
    for(ProductNumber *product in self.dataToDisplay)
    {

        NSString *shortProductNumber = @"";

        // go thru character by character

        for(int x = 0; x < product.productNumber.length; x++)
        {

            NSString *nextChar = [product.productNumber substringWithRange:NSMakeRange(x, 1)];

            // save valid characters in new string, ie, correctedProductNumbers
            if(![nextChar isEqualToString:@"0"]){

                shortProductNumber = [NSString stringWithFormat:@"%@%@", shortProductNumber, nextChar];
            }
        }

        // save corrected product number in array
        product.productNumberShort = shortProductNumber;

    }

}


#pragma mark TABLE VIEW

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.dataToDisplay.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"a" forIndexPath:indexPath];
    ProductNumber *number = [self.dataToDisplay objectAtIndex:indexPath.row];
    cell.textLabel.text = number.productNumber;
    cell.detailTextLabel.text = number.productNumberShort;

    return cell;

}


#pragma mark SEGUE

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {


    // all segues run this prepare for segue method
    // so check to see which segue it is
    // alternatively, we can see who the sender is

        NextVC *vc = (NextVC *)segue.destinationViewController;
        vc.title = @"Product";
        vc.message = @"Prod #";
        vc.descriptor = @"TBA";

}


#pragma mark OTHER


//-(NSInteger)getCount
//{
//
//    return self.dataToDisplay.count + 1;
//    
//}


@end

//
//  CustomKeyboard.m
//
//  Created by Kalyan Vishnubhatla on 10/9/12.
//
//

#import "CustomKeyboard.h"

@implementation CustomKeyboard
@synthesize delegate, currentSelectedTextboxIndex;

- (id)init {
    self = [super init];
    if (self){
        
    }
    return self;
}

- (UIToolbar *)getToolbarWithPrevNextDone:(BOOL)prevEnabled :(BOOL)nextEnabled
{    
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [toolbar setBarStyle:UIBarStyleBlackTranslucent];
    [toolbar sizeToFit];
    
    NSMutableArray *itemsArray = [[NSMutableArray alloc] init];
    
    UISegmentedControl *tabNavigation = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Previous", @"Next", nil]];
    tabNavigation.segmentedControlStyle = UISegmentedControlStyleBar;
    [tabNavigation setEnabled:prevEnabled forSegmentAtIndex:0];
    [tabNavigation setEnabled:nextEnabled forSegmentAtIndex:1];
    tabNavigation.momentary = YES;
    [tabNavigation addTarget:self action:@selector(segmentedControlHandler:) forControlEvents:UIControlEventValueChanged];
    UIBarButtonItem *barSegment = [[UIBarButtonItem alloc] initWithCustomView:tabNavigation];
    
    [itemsArray addObject:barSegment];

    UIBarButtonItem *flexButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [itemsArray addObject:flexButton];
    
    UIBarButtonItem *doneButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(userClickedDone:)];
    [itemsArray addObject:doneButton];

    toolbar.items = itemsArray;
        
    return toolbar;
}

- (UIToolbar *)getToolbarWithDone
{
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [toolbar setBarStyle:UIBarStyleBlackTranslucent];
    [toolbar sizeToFit];
    
    NSMutableArray *itemsArray = [[NSMutableArray alloc] init];
    
    UIBarButtonItem *flexButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [itemsArray addObject:flexButton];
    
    UIBarButtonItem *doneButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(userClickedDone:)];
    [itemsArray addObject:doneButton];
    
    toolbar.items = itemsArray;
    
    return toolbar;
}

/* Previous / Next segmented control changed value */
- (void)segmentedControlHandler:(id)sender
{
    if (delegate){
        switch ([(UISegmentedControl *)sender selectedSegmentIndex]) {
            case 0:
                [delegate previousClicked:currentSelectedTextboxIndex];
                break;
            case 1:
                [delegate nextClicked:currentSelectedTextboxIndex];
                break;
            default:
                break;
        }
    }
}

- (void)userClickedDone:(id)sender {
    if (delegate){
        [delegate doneClicked:currentSelectedTextboxIndex];
    }
}

@end

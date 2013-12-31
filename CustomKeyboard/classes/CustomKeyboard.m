//
//  MounzaCustomKeyboard.m
//  Mounza
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
    
    UIBarButtonItem *barSegment = [self getNextPrevButtons:prevEnabled :nextEnabled];

    UIBarButtonItem *flexButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIBarButtonItem *doneButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(userClickedDone:)];

    toolbar.items = [NSArray arrayWithObjects:barSegment, flexButton, doneButton, nil];
    
    return toolbar;
}

- (UIToolbar *)getToolbarWithPrevNext:(BOOL)prevEnabled :(BOOL)nextEnabled {
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [toolbar setBarStyle:UIBarStyleBlackTranslucent];
    [toolbar sizeToFit];
    
    // Segmented control with next and prev buttons
    UIBarButtonItem *barSegment = [self getNextPrevButtons:prevEnabled :nextEnabled];
    
    UIBarButtonItem *flexButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    toolbar.items = [NSArray arrayWithObjects:barSegment, flexButton, nil];
    
    return toolbar;
}

- (UIToolbar *)getToolbarWithDone
{
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [toolbar setBarStyle:UIBarStyleBlackTranslucent];
    [toolbar sizeToFit];
    
    UIBarButtonItem *flexButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIBarButtonItem *doneButton = [self getDoneButton];
    
    toolbar.items = [NSArray arrayWithObjects:flexButton, doneButton, nil];
    
    return toolbar;
}

- (UIBarButtonItem *)getNextPrevButtons:(BOOL)prevEnabled :(BOOL)nextEnabled {
    UISegmentedControl *tabNavigation = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Previous", @"Next", nil]];
    tabNavigation.segmentedControlStyle = UISegmentedControlStyleBar;
    [tabNavigation setEnabled:prevEnabled forSegmentAtIndex:0];
    [tabNavigation setEnabled:nextEnabled forSegmentAtIndex:1];
    tabNavigation.momentary = YES;
    [tabNavigation addTarget:self action:@selector(segmentedControlHandler:) forControlEvents:UIControlEventValueChanged];
    
    return [[UIBarButtonItem alloc] initWithCustomView:tabNavigation];
}

- (UIBarButtonItem *)getDoneButton {
    return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(userClickedDone:)];
}

/* Previous / Next segmented control changed value */
- (void)segmentedControlHandler:(id)sender
{
    switch ([(UISegmentedControl *)sender selectedSegmentIndex]) {
        case 0:
            if (delegate && [delegate respondsToSelector:@selector(previousClicked:)]) {
                [delegate previousClicked:currentSelectedTextboxIndex];
            }
            break;
        case 1:
            if (delegate && [delegate respondsToSelector:@selector(nextClicked:)]) {
                [delegate nextClicked:currentSelectedTextboxIndex];
            }
            break;
        default:
            break;
    }
}

- (void)userClickedDone:(id)sender {
    if (delegate && [delegate respondsToSelector:@selector(resignResponder:)]){
        [delegate resignResponder:currentSelectedTextboxIndex];
    }
}

@end

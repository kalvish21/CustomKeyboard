//
//  CustomKeyboard.m
//  CustomKeyboard
//
//  Created by Kalyan Vishnubhatla on 10/9/12.
//
//

#import "CustomKeyboard.h"

@implementation CustomKeyboard

#define IOS_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

@synthesize delegate = _delegate, currentSelectedTextboxIndex = _currentSelectedTextboxIndex;

- (id)init {
    self = [super init];
    if (self){
        self.navBarColor = [UIColor groupTableViewBackgroundColor];
        self.fontColor = [UIColor blackColor];
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
    
    UIBarButtonItem *doneButton = [self getDoneButton];
    
    toolbar.items = [NSArray arrayWithObjects:barSegment, flexButton, doneButton, nil];
    
    if (IOS_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        [toolbar setBarTintColor:self.navBarColor];
        [toolbar setTintColor:self.fontColor];
    } else {
        [toolbar setTintColor:self.navBarColor];
    }
    
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
    
    if (IOS_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        [toolbar setBarTintColor:self.navBarColor];
        [toolbar setTintColor:self.fontColor];
    } else {
        [toolbar setTintColor:self.navBarColor];
    }
    
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
    
    if (IOS_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        [toolbar setBarTintColor:self.navBarColor];
        [toolbar setTintColor:self.fontColor];
    } else {
        [toolbar setTintColor:self.navBarColor];
    }
    
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
            if (self.delegate && [self.delegate respondsToSelector:@selector(previousClicked:)]) {
                [self.delegate previousClicked:self.currentSelectedTextboxIndex];
            }
            break;
        case 1:
            if (self.delegate && [self.delegate respondsToSelector:@selector(nextClicked:)]) {
                [self.delegate nextClicked:self.currentSelectedTextboxIndex];
            }
            break;
        default:
            break;
    }
}

- (void)userClickedDone:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(resignResponder:)]){
        [self.delegate resignResponder:self.currentSelectedTextboxIndex];
    }
}


@end

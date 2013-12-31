//
//  CustomKeyboardViewController.m
//  CustomKeyboard
//
//  Created by Kalyan Vishnubhatla on 12/30/13.
//  Copyright (c) 2013 Kalyan Vishnubhatla. All rights reserved.
//

#import "CustomKeyboardViewController.h"

@interface CustomKeyboardViewController ()

@end

@implementation CustomKeyboardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    textBox1.tag = 1;
    textBox2.tag = 2;
    textBox3.tag = 3;
    textBox4.tag = 4;
    
    textBox1.delegate = self;
    textBox2.delegate = self;
    textBox3.delegate = self;
    textBox4.delegate = self;
    
    customKeyboard = [[CustomKeyboard alloc] init];
    customKeyboard.delegate = self;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    BOOL showPrev = textField.tag != 1;
    BOOL showNext = textField.tag != 4;
    
    [textField setInputAccessoryView:[customKeyboard getToolbarWithPrevNextDone:showPrev :showNext]];
    customKeyboard.currentSelectedTextboxIndex = textField.tag;
}

- (void)nextClicked:(NSUInteger)sender {
    switch (sender){
        case 1: {
            [textBox2 becomeFirstResponder];
        }
            break;
            
        case 2: {
            [textBox3 becomeFirstResponder];
        }
            break;
            
        case 3: {
            [textBox4 becomeFirstResponder];
        }
            break;
            
        default: {
        }
            break;
    }
}

- (void)previousClicked:(NSUInteger)sender {
    switch (sender){
        case 2: {
            [textBox1 becomeFirstResponder];
        }
            break;
            
        case 3: {
            [textBox2 becomeFirstResponder];
        }
            break;
            
        case 4: {
            [textBox3 becomeFirstResponder];
        }
            break;
            
        default: {
        }
            break;
    }
}

- (void)resignResponder:(NSUInteger)sender {
    switch (sender){
        case 1: {
            if ([textBox1 isFirstResponder]) {
                [textBox1 resignFirstResponder];
            }
        }
            break;
            
        case 2: {
            if ([textBox2 isFirstResponder]) {
                [textBox2 resignFirstResponder];
            }
        }
            break;
            
        case 3: {
            if ([textBox3 isFirstResponder]) {
                [textBox3 resignFirstResponder];
            }
        }
            break;
            
        case 4: {
            if ([textBox4 isFirstResponder]) {
                [textBox4 resignFirstResponder];
            }
        }
            break;
            
        default: {
        }
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

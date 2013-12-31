//
//  CustomKeyboardViewController.h
//  CustomKeyboard
//
//  Created by Kalyan Vishnubhatla on 12/30/13.
//  Copyright (c) 2013 Kalyan Vishnubhatla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomKeyboard.h"

@interface CustomKeyboardViewController : UIViewController <UITextFieldDelegate, CustomKeyboardDelegate>
{
    CustomKeyboard *customKeyboard;
    
    __weak IBOutlet UITextField *textBox1;
    __weak IBOutlet UITextField *textBox2;
    __weak IBOutlet UITextField *textBox3;
    __weak IBOutlet UITextField *textBox4;
}

@end

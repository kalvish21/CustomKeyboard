CustomKeyboard
==============

Provide Previous, Next, Done buttons for iOS keyboard

Usage
=====

The CustomKeyboard class has a delegate class CustomKeyboardDelegate. Any class requiring the CustomKeyboard implementation will need to implement the delegate functions. These functions are:

- (void)nextClicked:(NSUInteger)selectedId;
	This function will receive a call when the user clicks on the next button. The selectedId is the integer value of which textbox the user was in BEFORE clicking next.

- (void)previousClicked:(NSUInteger)selectedId;
	This function will be called when the user clicks on previous. The variable selectedId will have the id of the box that the user was on before clicking previous.

- (void)doneClicked:(NSUInteger)selectedId;
	This function will be called when the user clicks on done.


After implementing the three delegate functions, create an instance of the CustomKeyboard class and assign the delegate to that object (i.e. customKeyboard.delegate = self;).

When showing a keyboard for a particular box, inside the textFieldDidBeginEditing function, the following functions are available to create the toolbar above the keyboard:

- (UIToolbar *)getToolbarWithPrevNextDone:(BOOL)prevEnabled :(BOOL)nextEnabled;
	Generate a UIToolbar with Previous, Next, and Done. The variables prevEnabled and nextEnabled define if the buttons should be enabled or not (i.e. first box won't have previous enabled).

- (UIToolbar *)getToolbarWithDone;
	Generate a UIToolbar with only the Done button.
	

The functions above can be used in the following way:
[textField setInputAccessoryView:[customKeyboard getToolbarWithPrevNextDone:FALSE :TRUE]];

This would show Previous, Next, and Done. Previous button would be disabled.
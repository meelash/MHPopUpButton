MHPopUpButton

requires:
AppKit/Control.j
AppKit/CPPopUpButton.j

This is a pop up button that uses the HTML <select> element instead of manually building a menu like CPPopUpButton. Advantages: much better performance (noticeable with very long lists) and already supports key equivalents (again very useful with long lists).

It is rather hacked-together, in that I manually added style info, rather than using theming, since I haven't quite figured out how to use themes with Cappuccino yet. Also, the <select> is just made transparent and a CPPopUpButton added in the background. This works great in webkit, but in FireFox, the arrow of the <select> is still visible, so it's not perfect.
Also, Cappuccino source has to be modified, so that supportsDragAndDrop: in CPPlatform.j returns YES, for webkit.

To Use:
Download Cappuccino source.
Modify AppKit/Platform/DOM/CPPlatform.j, supportsDragAndDrop should return YES
Build and create the frameworks in your project directory.
Like CPPopUpButton, the height of your MHPopUpButton should be 24.

To Do (feel free to help out! This is good enough for my project right now, so I probably won't be doing these things any time soon):
Make a simple theme file to take care of all the .css styling
	Instead of just drawing a CPPopUpButton in the background, actually create 3 div elements with background images that pass mouse events through to the <select> element beneath. (This will fix the Firefox issue)
Implement the rest of the methods from CPPopUpButton and CPButton
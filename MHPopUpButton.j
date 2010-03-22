
@import <AppKit/CPControl.j>
@import <AppKit/CPPopUpButton.j>

@implementation MHPopUpButton : CPControl
{
    DOMElement      _DOMSelectElement;
    CPPopUpButton   backgroundPopUp;
}

- (id)initWithFrame:(CPRect)aFrame
{
    if (self = [super initWithFrame:aFrame])
    {
        backgroundPopUp = [[CPPopUpButton alloc] initWithFrame:aFrame];
        [backgroundPopUp setFrameOrigin:CGPointMake(0,0)];
        [self addSubview:backgroundPopUp];
        
//#if PLATFORM(DOM)
        _DOMSelectElement = document.createElement("select");
        _DOMSelectElement.style.position = "absolute";
        _DOMSelectElement.style.left = "0px";
        _DOMSelectElement.style.top = "0px";
        _DOMSelectElement.onclick = function() {[self performClick:self];};

        _DOMElement.appendChild(_DOMSelectElement);
        

        _DOMSelectElement.style.width = _DOMElement.style.width;
        _DOMSelectElement.style.height = "24px"; //CPRectGetHeight([backgroundPopUp frame]) + "px";
        _DOMSelectElement.style.border = "0px solid #bdbdbd";
        _DOMSelectElement.style.borderLeft = "5px solid transparent";
        _DOMSelectElement.style.borderRight = "32px solid transparent";
        _DOMSelectElement.style.font = "normal normal normal 13px/normal Arial, Arial, sans-serif";
        _DOMSelectElement.style.textOverflow = "ellipsis";
        _DOMSelectElement.style.overflow = "hidden";
        _DOMSelectElement.style.webkitAppearance = "none";
        _DOMSelectElement.style.backgroundColor = "transparent";
//#endif
    }
    return self;
}

- (void)removeAllItems
{
    var numberOfItems=_DOMSelectElement.options.length;
    for (var i=0; i<numberOfItems; i++)
    {
        _DOMSelectElement.remove(_DOMSelectElement.options[0]);
    }
}

- (void)addItemsWithTitles:(CPArray)titles
{
    for (var i=0; i<[titles count]; i++)
    {
        var DOMOption = document.createElement("option");
        DOMOption.innerHTML = titles[i];
        DOMOption.style.font = "normal normal normal 13px/normal Arial, Arial, sans-serif";
        DOMOption.style.textOverflow = "ellipsis";
        DOMOption.style.backgroundColor = "F4F4F4";
        _DOMSelectElement.options.add(DOMOption);
    }
    
}

- (void)selectItemAtIndex:(int)anIndex
{
    if (_DOMSelectElement.options.selectedIndex == anIndex)
        return;

    _DOMSelectElement.options.selectedIndex=anIndex;
    [self performClick:self];
}

- (CPString)itemTitleAtIndex:(int)anIndex
{
    if (_DOMSelectElement.options.length>anIndex)
        return _DOMSelectElement.options[anIndex].innerHTML;
    return nil;
}

- (int)indexOfSelectedItem
{
    return _DOMSelectElement.options.selectedIndex;
}

- (int)indexOfLastItem
{
    return _DOMSelectElement.options.length-1;
}

- (id)objectValue
{
    return _DOMSelectElement.options.selectedIndex;
}

- (void)setObjectValue:(id)aValue
{
    [self selectItemAtIndex:[aValue intValue]];
}

@end

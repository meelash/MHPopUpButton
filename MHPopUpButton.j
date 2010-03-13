
@import <AppKit/CPControl.j>

@implementation MHPopUpButton : CPControl
{
    DOMElement      _DOMSelectElement;
}

- (id)initWithFrame:(CPRect)aFrame
{
    if (self = [super initWithFrame:aFrame])
    {
//#if PLATFORM(DOM)
        _DOMSelectElement = document.createElement("select");
        _DOMSelectElement.style.position = "absolute";
        _DOMSelectElement.style.left = "0px";
        _DOMSelectElement.style.top = "0px";

        _DOMElement.appendChild(_DOMSelectElement);
//#endif
    }
    return self;
}

- (void)removeAllItems
{
    var numberOfItems=_DOMSelectElement.options.length;
    for (var i=0; i<numberOfItems; i++)
    {
        _DOMSelectElement.options.remove(_DOMSelectElement.options[0]);
    }
}

- (void)addItemsWithTitles:(CPArray)titles
{
    for (var i=0; i<[titles count]; i++)
    {
        var DOMoption = document.createElement("option");
        DOMoption.innerHTML = titles[i];
        _DOMSelectElement.options.add(DOMoption);
    }
    
}

- (void)selectItemAtIndex:(int)anIndex
{
    if (_DOMSelectElement.options.selectedIndex == anIndex)
        return;

    _DOMSelectElement.options.selectedIndex=anIndex;
    [self sendAction:[self action] to:[self target]];
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

/* 
 * This class will adjust the screen dimension when the UI changes such as refreshing/reloading UI
 * after the browser has been resized.
 */
function UIManager(width, height)
{
    this.defaultWidth = width ;
    this.defaultHeight = height;
    this.offsetWidth = 0;
    this.offsetHeight = 0;
    this.currentBodyWidth = 0;
    this.currentBodyHeight = 0;
    this.scrollerWidth = this.getScrollerWidth();

    // self referencing pointer
    var self = this;
    // Attach the event handler to resize event.
    $(window).resize(function(){
        self.adjustScreenDimension();
    });
}

UIManager.prototype.adjustScreenDimension = function()
{
    // Initializing the screen's width & height to recommended settings.
    if($("body").width() < this.defaultWidth - this.scrollerWidth)
        $("body").width(this.defaultWidth);
    else
        $("body").width($(document).width() - this.scrollerWidth);

    this.currentBodyWidth = $("body").width();

    if($("body").height() < this.defaultHeight - this.scrollerWidth)
    {
        $("body").height(this.defaultHeight);
        // When the body width is greater than or equal to defautl width but the height is smaller than default,
        // the browser will display scroll bar so we need to deduct the width of scroll bar
        // from existing body's width.
        $("body").width(this.currentBodyWidth - this.scrollerWidth);
    }
    else
        $("body").height($(document).height());

    this.currentBodyHeight = $("body").height();

    // Calculate the offset widht & height after the screen has been resized.
    // E.g the default width is 1000px and now the actual width of body is 1200px,
    // then the offset width is 200px.
    this.offsetWidth = this.currentBodyWidth - this.defaultWidth;
    this.offsetHeight = this.currentBodyHeight - this.defaultHeight;
};

UIManager.prototype.getScrollerWidth = function()
{
    var scr = null;
    var inn = null;
    var wNoScroll = 0;
    var wScroll = 0;

    // Outer scrolling div
    scr = document.createElement('div');
    scr.style.position = 'absolute';
    scr.style.top = '-1000px';
    scr.style.left = '-1000px';
    scr.style.width = '100px';
    scr.style.height = '50px';
    // Start with no scrollbar
    scr.style.overflow = 'hidden';

    // Inner content div
    inn = document.createElement('div');
    inn.style.width = '100%';
    inn.style.height = '200px';

    // Put the inner div in the scrolling div
    scr.appendChild(inn);
    // Append the scrolling div to the doc
    document.body.appendChild(scr);

    // Width of the inner div sans scrollbar
    wNoScroll = inn.offsetWidth;
    // Add the scrollbar
    scr.style.overflow = 'auto';
    // Width of the inner div width scrollbar
    wScroll = inn.offsetWidth;

    // Remove the scrolling div from the doc
    document.body.removeChild(
        document.body.lastChild);

    // Pixel width of the scroller
    return (wNoScroll - wScroll);
};


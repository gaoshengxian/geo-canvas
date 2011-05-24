/**
 *  Author : Aung Thaw Aye
 *  This javascript utility is to make the drawing and placing marker in google map to be much easier. Using this,
 *  you can place marker(s) inside the polygon. Normally, when you click the map to place marker but the place where
 *  you clicked is inside the polygon, then you can't not get latlng for your clicked point. Using this javascript,
 *  that problem is solved. You need to use jQuery in your application to be able to import this javascript.
 */
function MapManager(gmap)
{
    this.map = gmap;
    this.onCompletePaintingMarker = null;
    this.onCompletePaintingShape = null;
    this.mousePosX = 0;
    this.mousePosY = 0;

    var self = this;
    
    $(self.map.getContainer()).mousemove(function(e)
    {
        self.mousePosX = e.pageX - this.offsetLeft;
        self.mousePosY = e.pageY - this.offsetTop;        
    });
}

MapManager.prototype.paintMarker = function(options)
{
    var title = "Unknown";
    var iconUrl = null;
    var draggable = true;
    var self = this;

    if(options)
    {
        title = options.title != null ? options.title : "Unknown";
        iconUrl = options.iconUrl != null ? options.iconUrl : null ;
        draggable = options.draggable != null ? options.draggable : true;
    }

    var cursorListener = GEvent.addListener(self.map, 'mousemove', function(latlng)
    {
        // To change the mouse pointer when it is in drawing mode.
        self.map.getDragObject().setDraggableCursor("crosshair");
    });

    var listener = GEvent.addListener(self.map, "click", function(overlay, latlng)
    {
        if(latlng == null)
            latlng = self.map.fromContainerPixelToLatLng(new GPoint(self.mousePosX, self.mousePosY));

        if (latlng)
        {
            GEvent.removeListener(listener);
            GEvent.removeListener(cursorListener);
            self.map.getDragObject().setDraggableCursor("default");

            var tinyIcon = new GIcon();
            tinyIcon.image = iconUrl;
            tinyIcon.iconSize = new GSize(32, 32);
            tinyIcon.shadowSize = new GSize(32, 32);
            tinyIcon.iconAnchor = new GPoint(14, 32);
            tinyIcon.infoWindowAnchor = new GPoint(14, 1);


            var marker = new GMarker(latlng,
            {
                icon: tinyIcon,
                title: title,
                draggable: draggable
            });

            self.map.addOverlay(marker);
            
            if(typeof self.onCompletePaintingMarker == "function")
                self.onCompletePaintingMarker(marker);
        }
    });
};

MapManager.prototype.paintLine = function(options)
{
    var borderColor = "#ff0000";
    var borderOpacity = 0.8;
    var borderWidth = 5;
    var fillColor = "#ff0000";
    var fillOpacity = 0.3

    if(options)
    {
        borderColor = options.borderColor;
        borderOpacity = options.borderOpacity;
        borderWidth = options.borderWidth;
        fillColor = options.fillColor;
        fillOpacity = options.fillOpacity;
    }

    var self = this;
    var polygon = new GPolyline([], borderColor, borderWidth, borderOpacity, fillColor, fillOpacity);

    this.map.addOverlay(polygon);
    polygon.enableDrawing(options);

    polygon.enableEditing({
        onEvent: "mouseover"
    });
    polygon.disableEditing({
        onEvent: "mouseout"
    });

    var cursorListener = GEvent.addListener(self.map, 'mousemove', function(latlng)
    {
        // To change the mouse pointer when it is in drawing mode.
        self.map.getDragObject().setDraggableCursor("crosshair");
    });
    
    var listener = GEvent.addListener(polygon, "endline", function()
    {
        if(typeof self.onCompletePaintingShape == "function")
            self.onCompletePaintingShape(polygon);
        
        GEvent.removeListener(listener);
        GEvent.removeListener(cursorListener);
        self.map.getDragObject().setDraggableCursor("default");


        GEvent.addListener(polygon, "click", function(latlng, index)
        {
            if (typeof index == "number")
            {
                polygon.deleteVertex(index);
            }
        });
    });
};

MapManager.prototype.paintPolygon = function(options)
{
    var borderColor = "#ff0000";
    var borderOpacity = 0.8;
    var borderWidth = 5;
    var fillColor = "#ff0000";
    var fillOpacity = 0.3

    if(options)
    {
        borderColor = options.borderColor;
        borderOpacity = options.borderOpacity;
        borderWidth = options.borderWidth;
        fillColor = options.fillColor;
        fillOpacity = options.fillOpacity;
    }

    var self = this;
    var polygon = new GPolygon([], borderColor, borderWidth, borderOpacity, fillColor, fillOpacity);

    this.map.addOverlay(polygon);
    polygon.enableDrawing(options);

    polygon.enableEditing({
        onEvent: "mouseover"
    });
    polygon.disableEditing({
        onEvent: "mouseout"
    });

    var cursorListener = GEvent.addListener(self.map, 'mousemove', function(latlng)
    {
        // To change the mouse pointer when it is in drawing mode.
        self.map.getDragObject().setDraggableCursor("crosshair");
    });

    var listener = GEvent.addListener(polygon, "endline", function()
    {
        if(typeof self.onCompletePaintingShape == "function")
            self.onCompletePaintingShape(polygon);

        GEvent.removeListener(listener);
        GEvent.removeListener(cursorListener);
        self.map.getDragObject().setDraggableCursor("default");


        GEvent.addListener(polygon, "click", function(latlng, index)
        {
            if (typeof index == "number")
            {
                polygon.deleteVertex(index);
            }
        });
    });
};
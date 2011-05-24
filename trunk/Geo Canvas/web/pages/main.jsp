<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html>
    <head>
        <title>Geo Canvas</title>

        <link type="text/css" href="css/styles.css" rel="stylesheet" />
        <link type="text/css" href="css/ocean/ui-ocean.css" rel="stylesheet" />
        <link type="text/css" href="css/ui.jqgrid.css" rel="stylesheet" />

        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery-ui.js"></script>
        <script type="text/javascript" src="js/grid/grid.locale-en.js"></script>
        <script type="text/javascript" src="js/grid/jqgrid.js"></script>
        <script type="text/javascript" src="js/util/map-manager.js"></script>
        <script type="text/javascript" src="js/ui/tabs/marker-tab-ui.js"></script>

        <script src="http://maps.google.com/maps?file=api&v=2&key=ABQIAAAA5ayIGld0GtcybqZ7ixlQyRT2yXp_ZAY8_ufC3CFXhHIE1NvwkxQtwkMYh7bhwXzqy9_tnvOA-MOnAQ" type="text/javascript"></script>
        <script>

            /*
             *  Global Variables
             **/
            var MAP_MANAGER = null;
            $(document).ready(function()
            {
                // Load google map.
                var map = new GMap2($("#map").get(0));
                var burnsvilleMN = new GLatLng(44.797916,-93.278046);
                map.setCenter(burnsvilleMN, 8);

                // Init variables
                MAP_MANAGER = new MapManager(map);

                // Tabs
                $('#tabs').tabs();

                // Buttons
                $('.btn').button();

                // To load the Grid in marker tab.
                loadMarkerTabUI();
            }); // End of jQuery main function.

            function drawMarker()
            {
                var icon = $(":radio[name=markerIcon]:checked").val();
                var iconUrl = "css/images/marker-" + icon + ".png";
                var isDraggable = $(":checkbox[name:isDraggable]:checked").val();
                var title = $(":text[name=title]").val();

                MAP_MANAGER.paintMarker(
                {
                    iconUrl : iconUrl,
                    draggable : (isDraggable != null ? isDraggable : false),
                    title : title
                });
            }

        </script>
    </head>
    <body>
        <div id="content">
            <table class="content" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="250px">
                        <div id="tabs">
                            <ul>
                                <li><a href="#tabs-1">Marker</a></li>
                                <li><a href="#tabs-2">Polygon</a></li>
                                <li><a href="#tabs-3">Search</a></li>
                            </ul>
                            <!-- Tabs-1 STARTS -->
                            <div id="tabs-1">
                                <jsp:include page="tab-pages/marker-tab.jsp"></jsp:include>
                            </div>
                            <!-- Tabs-1 ENDS -->
                            <div id="tabs-2">Phasellus mattis tincidunt nibh. Cras orci urna, blandit id, pretium vel, aliquet ornare, felis. Maecenas scelerisque sem non nisl. Fusce sed lorem in enim dictum bibendum.</div>
                            <div id="tabs-3">Nam dui erat, auctor a, dignissim quis, sollicitudin eu, felis. Pellentesque nisi urna, interdum eget, sagittis et, consequat vestibulum, lacus. Mauris porttitor ullamcorper augue.</div>
                        </div>
                    </td>
                    <td>
                        <div id="map"> Something inside Map. </div>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>

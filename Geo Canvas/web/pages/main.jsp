<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html>
    <head>
        <title>Geo Canvas</title>

        <link type="text/css" href="css/styles.css" rel="stylesheet" />
        <link type="text/css" href="css/ocean/ui-ocean.css" rel="stylesheet" />
        <link type="text/css" href="css/flexigrid/flexigrid.css" rel="stylesheet" />

        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery-ui.js"></script>
        <script type="text/javascript" src="js/ui/app-ui-manager.js"></script>
        <script type="text/javascript" src="js/util/ui-manager.js"></script>
        <script type="text/javascript" src="js/util/ui-table.js"></script>
        <script type="text/javascript" src="js/util/paint-manager.js"></script>
        <script type="text/javascript" src="js/grid/grid.locale-en.js"></script>
        <script type="text/javascript" src="js/grid/jquery.jqGrid.min.js"></script>

        <script src="http://maps.google.com/maps?file=api&v=2&key=ABQIAAAA5ayIGld0GtcybqZ7ixlQyRT2yXp_ZAY8_ufC3CFXhHIE1NvwkxQtwkMYh7bhwXzqy9_tnvOA-MOnAQ" type="text/javascript"></script>
        <script>

            /*
             *  Global Variables
             **/
            var PAINT_MANAGER = null;


            $(document).ready(function()
            {


                // Load google map.
                var map = new GMap2($("#map").get(0));
                var burnsvilleMN = new GLatLng(44.797916,-93.278046);
                map.setCenter(burnsvilleMN, 8);

                // Init variables
                PAINT_MANAGER = new PaintManager(map);

                // Tabs
                $('#tabs').tabs();

                // Buttons
                $('.btn').button();

                Table.paginate('#celebs', 10);

            });

            function drawMarker()
            {
                var icon = $(":radio[name=markerIcon]:checked").val();
                var iconUrl = "css/images/marker-" + icon + ".png";
                var isDraggable = $(":checkbox[name:isDraggable]:checked").val();
                var title = $(":text[name=title]").val();

                $("#console").text(iconUrl);

                PAINT_MANAGER.paintMarker(
                {
                    iconUrl : iconUrl,
                    draggable : (isDraggable != null ? isDraggable : false),
                    title : title
                }
            );
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
                                <table class="marker-table" cellpadding="5" cellspacing="5">
                                    <tr>
                                        <td colspan="4">
                                            Please select one of the following icons :
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="marker-table-icon">
                                            &nbsp;
                                            <img src="css/images/marker-blue.png" title="Blue"/>
                                            <br/>
                                            <input type="radio" name="markerIcon" value="blue" checked />
                                        </td>
                                        <td class="marker-table-icon">
                                            &nbsp;
                                            <img src="css/images/marker-red.png" title="Red"/>
                                            <br/>
                                            <input type="radio" name="markerIcon" value="red" />
                                        </td>
                                        <td class="marker-table-icon">
                                            &nbsp;
                                            <img src="css/images/marker-green.png" title="Green"/>
                                            <br/>
                                            <input type="radio" name="markerIcon" value="green" />
                                        </td>
                                        <td class="marker-table-icon">
                                            &nbsp;
                                            <img src="css/images/marker-yellow.png" title="Yellow"/>
                                            <br/>
                                            <input type="radio" name="markerIcon" value="yellow" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            Marker is draggable : 
                                        </td>
                                        <td colspan="2">
                                            <input type="checkbox" name="isDraggable" value="true"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            Title of the marker :
                                        </td>
                                        <td colspan="2">
                                            <input type="text" name="title" value="" maxlength="30"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <span id="console"></span>
                                        </td>
                                        <td colspan="2">
                                            <input type="button" class="btn" name="Draw" value="Draw" onclick="drawMarker();"/>
                                        </td>
                                    </tr>
                                </table>

                                <table id="celebs">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Name</th>
                                            <th>Occupation</th>

                                            <th>Approx. Location</th>
                                            <th>Price</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>203A</td>

                                            <td>Johny Stardust (<a href="bio.pdf">bio</a>)</td>
                                            <td>Front-man</td>
                                            <td>
                                                <a class="ttarget" href="http://www.la.com/">Los Angeles</a>
                                            </td>
                                            <td>$39.95</td>

                                        </tr>
                                        <tr>
                                            <td>6636</td>
                                            <td>Glendatronix</td>
                                            <td>Keytarist</td>
                                            <td><a href="http://www.london.co.uk/" class="tooltip" title="Check out all the Celebs in London this week.">London</a></td>
                                            <td>$39.95</td>

                                        </tr>
                                        <tr>
                                            <td>141B</td>
                                            <td>Beau Dandy (<a href="bosom.png" class="lightbox">pic</a>)</td>
                                            <td>Singer</td>
                                            <td><a href="http://www.newyork.com/">New York</a></td>

                                            <td>$39.95</td>
                                        </tr>
                                        <tr>
                                            <td>2031</td>
                                            <td>Mo' Fat</td>
                                            <td>Producer</td>
                                            <td><a href="http://www.newyork.com/">New York</a></td>

                                            <td>$19.95</td>
                                        </tr>
                                        <tr>
                                            <td>007F</td>
                                            <td>Kellie Kelly</td>
                                            <td>Singer</td>
                                            <td><a href="http://www.omaha.com/">Omaha</a></td>

                                            <td>$11.95</td>
                                        </tr>
                                        <tr>
                                            <td>8A05</td>
                                            <td>Darth Fader</td>
                                            <td>DJ</td>
                                            <td><a href="http://www.london.co.uk/">London</a></td>

                                            <td>$19.95</td>
                                        </tr>
                                        <tr>
                                            <td>203A</td>
                                            <td>Johny Stardust (<a href="bio.pdf">bio</a>)</td>
                                            <td>Front-man</td>

                                            <td>
                                                <a class="ttarget" href="http://www.la.com/">Los Angeles</a>
                                            </td>
                                            <td>$39.95</td>
                                        </tr>
                                        <tr>
                                            <td>6636</td>

                                            <td>Glendatronix</td>
                                            <td>Keytarist</td>
                                            <td><a href="http://www.london.co.uk/" class="tooltip" title="Check out all the Celebs in London this week.">London</a></td>
                                            <td>$39.95</td>
                                        </tr>
                                        <tr>
                                            <td>141B</td>

                                            <td>Beau Dandy (<a href="bosom.png" class="lightbox">pic</a>)</td>
                                            <td>Singer</td>
                                            <td><a href="http://www.newyork.com/">New York</a></td>
                                            <td>$39.95</td>
                                        </tr>
                                        <tr>

                                            <td>2031</td>
                                            <td>Mo' Fat</td>
                                            <td>Producer</td>
                                            <td><a href="http://www.newyork.com/">New York</a></td>
                                            <td>$19.95</td>
                                        </tr>

                                        <tr>
                                            <td>007F</td>
                                            <td>Kellie Kelly</td>
                                            <td>Singer</td>
                                            <td><a href="http://www.omaha.com/">Omaha</a></td>
                                            <td>$11.95</td>

                                        </tr>
                                        <tr>
                                            <td>8A05</td>
                                            <td>Darth Fader</td>
                                            <td>DJ</td>
                                            <td><a href="http://www.london.co.uk/">London</a></td>
                                            <td>$19.95</td>

                                        </tr>
                                        <tr>
                                            <td>203A</td>
                                            <td>Johny Stardust (<a href="bio.pdf">bio</a>)</td>
                                            <td>Front-man</td>
                                            <td>

                                                <a class="ttarget" href="http://www.la.com/">Los Angeles</a>
                                            </td>
                                            <td>$39.95</td>
                                        </tr>
                                        <tr>
                                            <td>6636</td>
                                            <td>Glendatronix</td>

                                            <td>Keytarist</td>
                                            <td><a href="http://www.london.co.uk/" class="tooltip" title="Check out all the Celebs in London this week.">London</a></td>
                                            <td>$39.95</td>
                                        </tr>
                                        <tr>
                                            <td>141B</td>
                                            <td>Beau Dandy (<a href="bosom.png" class="lightbox">pic</a>)</td>

                                            <td>Singer</td>
                                            <td><a href="http://www.newyork.com/">New York</a></td>
                                            <td>$39.95</td>
                                        </tr>
                                        <tr>
                                            <td>2031</td>
                                            <td>Mo' Fat</td>

                                            <td>Producer</td>
                                            <td><a href="http://www.newyork.com/">New York</a></td>
                                            <td>$19.95</td>
                                        </tr>
                                        <tr>
                                            <td>007F</td>
                                            <td>Kellie Kelly</td>

                                            <td>Singer</td>
                                            <td><a href="http://www.omaha.com/">Omaha</a></td>
                                            <td>$11.95</td>
                                        </tr>
                                        <tr>
                                            <td>8A05</td>
                                            <td>Darth Fader</td>

                                            <td>DJ</td>
                                            <td><a href="http://www.london.co.uk/">London</a></td>
                                            <td>$19.95</td>
                                        </tr>
                                        <tr>
                                            <td>203A</td>
                                            <td>Johny Stardust (<a href="bio.pdf">bio</a>)</td>

                                            <td>Front-man</td>
                                            <td>
                                                <a class="ttarget" href="http://www.la.com/">Los Angeles</a>
                                            </td>
                                            <td>$39.95</td>
                                        </tr>
                                        <tr>

                                            <td>6636</td>
                                            <td>Glendatronix</td>
                                            <td>Keytarist</td>
                                            <td><a href="http://www.london.co.uk/" class="tooltip" title="Check out all the Celebs in London this week.">London</a></td>
                                            <td>$39.95</td>
                                        </tr>

                                        <tr>
                                            <td>141B</td>
                                            <td>Beau Dandy (<a href="bosom.png" class="lightbox">pic</a>)</td>
                                            <td>Singer</td>
                                            <td><a href="http://www.newyork.com/">New York</a></td>
                                            <td>$39.95</td>

                                        </tr>
                                        <tr>
                                            <td>2031</td>
                                            <td>Mo' Fat</td>
                                            <td>Producer</td>
                                            <td><a href="http://www.newyork.com/">New York</a></td>
                                            <td>$19.95</td>

                                        </tr>
                                        <tr>
                                            <td>007F</td>
                                            <td>Kellie Kelly</td>
                                            <td>Singer</td>
                                            <td><a href="http://www.omaha.com/">Omaha</a></td>
                                            <td>$11.95</td>

                                        </tr>
                                        <tr>
                                            <td>8A05</td>
                                            <td>Darth Fader</td>
                                            <td>DJ</td>
                                            <td><a href="http://www.london.co.uk/">London</a></td>
                                            <td>$19.95</td>

                                        </tr>
                                    </tbody>
                                </table>

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

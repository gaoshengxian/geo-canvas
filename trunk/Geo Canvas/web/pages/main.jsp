<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html>
    <head>
        <title>Geo Canvas</title>
        <link type="text/css" href="css/styles.css" rel="stylesheet" />
        <link type="text/css" href="css/ocean/ui-ocean.css" rel="stylesheet" />
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery-ui.js"></script>
        <script type="text/javascript" src="js/ui/app-ui-manager.js"></script>
        <script type="text/javascript" src="js/util/ui-manager.js"></script>
        <script type="text/javascript" src="js/util/paint-manager.js"></script>
        <script type="text/javascript" src="js/grid/grid.locale-en.js"></script>
        <script type="text/javascript" src="js/grid/jquery.jqGrid.min.js"></script>

        <script src="http://maps.google.com/maps?file=api&v=2&key=ABQIAAAA5ayIGld0GtcybqZ7ixlQyRT2yXp_ZAY8_ufC3CFXhHIE1NvwkxQtwkMYh7bhwXzqy9_tnvOA-MOnAQ" type="text/javascript"></script>
        <script>
            $(document).ready(function(){
                // Init UI
//                var appManager = new AppUIManager();
//                appManager.setupUI();

                // Load google map.
                var map = new GMap2($("#map").get(0));
                var burnsvilleMN = new GLatLng(44.797916,-93.278046);
                map.setCenter(burnsvilleMN, 8);

                // Tabs
                $('#tabs').tabs();

                // Buttons
                $('.btn').button();

              
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

                                        </td>
                                        <td colspan="2">
                                            <input type="button" class="btn" name="Draw" value="Draw"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <br/>
                                            
                                        </td>
                                    </tr>
                                </table>

                                <table id="jqGridTbl"></table>
    <div id="prowed2"></div>
                            </div>
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
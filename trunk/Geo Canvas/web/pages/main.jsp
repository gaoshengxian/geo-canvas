<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html>
    <head>
        <link type="text/css" href="css/styles.css" rel="stylesheet" />
        <link type="text/css" href="css/ocean/ui-ocean.css" rel="stylesheet" />
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery-ui.js"></script>
        <script type="text/javascript" src="js/ui/app-ui-manager.js"></script>
        <script type="text/javascript" src="js/util/ui-manager.js"></script>
        <script type="text/javascript" src="js/util/paint-manager.js"></script>
        <script src="http://maps.google.com/maps?file=api&v=2&key=ABQIAAAA5ayIGld0GtcybqZ7ixlQyRT2yXp_ZAY8_ufC3CFXhHIE1NvwkxQtwkMYh7bhwXzqy9_tnvOA-MOnAQ" type="text/javascript"></script>
        <script>
            $(document).ready(function(){
                
                var appUIManager = new AppUIManager();
                //appUIManager.adjustUI();

                $(window).resize(function(){
                    //appUIManager.adjustUI();
                })
                // Tabs
                $('#tabs').tabs();
            })
        </script>
    </head>
    <body>
        <div id="content">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="250px">
                        <div id="tabs" style="width:250px; height: 100%; float:left;">
                            <ul>
                                <li><a href="#tabs-1">First</a></li>
                                <li><a href="#tabs-2">Second</a></li>
                                <li><a href="#tabs-3">Third</a></li>
                            </ul>
                            <div id="tabs-1">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
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
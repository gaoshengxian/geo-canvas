<table class="marker-tab-content-table" cellpadding="0" cellspacing="0" border="0" height="100%">
    <tr style="height: 180px;">
        <td>
            <table class="marker-table" cellpadding="2" cellspacing="2">
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
                    <td class="marker-table-labels" colspan="2">
                        Marker is draggable :
                    </td>
                    <td colspan="2">
                        <input type="checkbox" name="isDraggable" value="true"/>
                    </td>
                </tr>
                <tr>
                    <td class="marker-table-labels" colspan="2">
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
                        <input type="button" class="btn" name="Draw" value="Draw" onclick="drawMarker();"/>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            Whenever you place a marker on the map, its information will be added to the below table.<br/>
            <br/><br/>
            <div id="grid-wrapper">
                <table id="grid-marker" style="width: 280px;"></table>
                <div id="grid-marker-nav"></div>
            </div>
        </td>
    </tr>
</table>





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

<div>
    <table id="list47" style="width: 280px;"></table>
    <div id="plist47"></div>
</div>

<script>
    var mydata = [
        {id:"1",invdate:"2010-05-24",name:"test",note:"note",tax:"10.00",total:"2111.00"} ,
        {id:"2",invdate:"2010-05-25",name:"test2",note:"note2",tax:"20.00",total:"320.00"},
        {id:"3",invdate:"2007-09-01",name:"test3",note:"note3",tax:"30.00",total:"430.00"},
        {id:"4",invdate:"2007-10-04",name:"test",note:"note",tax:"10.00",total:"210.00"},
        {id:"5",invdate:"2007-10-05",name:"test2",note:"note2",tax:"20.00",total:"320.00"},
        {id:"6",invdate:"2007-09-06",name:"test3",note:"note3",tax:"30.00",total:"430.00"},
        {id:"7",invdate:"2007-10-04",name:"test",note:"note",tax:"10.00",total:"210.00"},
        {id:"8",invdate:"2007-10-03",name:"test2",note:"note2",amount:"300.00",tax:"21.00",total:"320.00"},
        {id:"9",invdate:"2007-09-01",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00"},
        {id:"11",invdate:"2007-10-01",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
        {id:"12",invdate:"2007-10-02",name:"test2",note:"note2",amount:"300.00",tax:"20.00",total:"320.00"},
        {id:"13",invdate:"2007-09-01",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00"},
        {id:"14",invdate:"2007-10-04",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
        {id:"15",invdate:"2007-10-05",name:"test2",note:"note2",amount:"300.00",tax:"20.00",total:"320.00"},
        {id:"16",invdate:"2007-09-06",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00"},
        {id:"17",invdate:"2007-10-04",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
        {id:"18",invdate:"2007-10-03",name:"test2",note:"note2",amount:"300.00",tax:"20.00",total:"320.00"},
        {id:"19",invdate:"2007-09-01",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00"},
        {id:"21",invdate:"2007-10-01",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
        {id:"22",invdate:"2007-10-02",name:"test2",note:"note2",amount:"300.00",tax:"20.00",total:"320.00"},
        {id:"23",invdate:"2007-09-01",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00"},
        {id:"24",invdate:"2007-10-04",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
        {id:"25",invdate:"2007-10-05",name:"test2",note:"note2",amount:"300.00",tax:"20.00",total:"320.00"},
        {id:"26",invdate:"2007-09-06",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00"},
        {id:"27",invdate:"2007-10-04",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
        {id:"28",invdate:"2007-10-03",name:"test2",note:"note2",amount:"300.00",tax:"20.00",total:"320.00"},
        {id:"29",invdate:"2007-09-01",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00"}
    ];
    jQuery("#list47").jqGrid({
        data: mydata,
        datatype: "local",
        height: 150,
        rowNum: 10,
        rowList: [10,20,30],
        colNames:['Inv No','Date', 'Client', 'Amount','Tax','Total','Notes'],
        colModel:[
            {name:'id',index:'id', width:60, sorttype:"int"},
            {name:'invdate',index:'invdate', width:90, sorttype:"date", formatter:"date"},
            {name:'name',index:'name', width:100},
            {name:'amount',index:'amount', width:80, align:"right",sorttype:"float", formatter:"number"},
            {name:'tax',index:'tax', width:80, align:"right",sorttype:"float"},
            {name:'total',index:'total', width:80,align:"right",sorttype:"float"},
            {name:'note',index:'note', width:150, sortable:false}
        ],
        pager: "#plist47",
        viewrecords: true,
        caption: "Manipulating Array Data"
    });
</script>
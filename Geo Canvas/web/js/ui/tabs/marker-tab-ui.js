/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function loadMarkerTabUI()
{
    var mydata = [
        {id:"1",invdate:"2007-10-01",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
        {id:"2",invdate:"2007-10-01",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
        {id:"3",invdate:"2007-10-01",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
        {id:"4",invdate:"2007-10-01",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
        {id:"5",invdate:"2007-10-01",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
        {id:"6",invdate:"2007-10-01",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
        {id:"7",invdate:"2007-10-01",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
        {id:"8",invdate:"2007-10-01",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
        {id:"9",invdate:"2007-10-01",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
        {id:"10",invdate:"2007-10-01",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
        {id:"11",invdate:"2007-10-01",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
        {id:"12",invdate:"2007-10-01",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
        {id:"13",invdate:"2007-10-01",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
        {id:"14",invdate:"2007-10-01",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
        {id:"15",invdate:"2007-10-01",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
        {id:"16",invdate:"2007-10-01",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
        {id:"17",invdate:"2007-10-01",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"}
    ];

    jQuery("#grid-marker").jqGrid({
        defaults : {
            recordtext: null,
            emptyrecords: null,
            loadtext: null,
            pgtext : "Page {0} of {1}"
        },
        datatype: "local",
        height: 150,
        rowNum: 5,
        rowList: [5,10,15],
        colNames:['Inv No','Date', 'Client', 'Amount','Tax','Total','Notes'],
        colModel:[
            {name:'id',index:'id',width:60,sorttype:"int"},
            {name:'invdate',index:'invdate',width:90,sorttype:"date"},
            {name:'name',index:'name',width:100},
            {name:'amount',index:'amount',width:80,align:"right",sorttype:"float"},
            {name:'tax',index:'tax',width:80,align:"right",sorttype:"float"},
            {name:'total',index:'total',width:80,align:"right",sorttype:"float"},
            {name:'note',index:'note',width:150,sortable:false}
        ],
        pager: "#grid-marker-nav",
        viewrecords: true,
        caption: "The information of Markers on the Map.",
        autowidth: true,
        shrinkToFit: false,
        width: 280,
        viewrecords: false,
        pagerpos: "center"
    });

    for(var i=0;i<=mydata.length;i++) 
        jQuery("#grid-marker").jqGrid('addRowData',i+1,mydata[i]);
    
    jQuery("#grid-marker").setGridParam({rowNum: 5}).trigger("reloadGrid");
}

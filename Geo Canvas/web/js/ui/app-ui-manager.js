/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
function AppUIManager()
{
//this.uiManager = new UIManager(1024,768);
//this.uiManager.adjustScreenDimension();
}

AppUIManager.prototype.setupUI = function()
{
    // Setup Marker Table
    $("#marker-table").jqGrid(
    {
        datatype: "local",
        height: 100,
        hidegrid: false,
        colNames:['Id','Coordinates', 'Title'],
        colModel:[
        {
            name:'id',
            index:'id',
            width:60
        },

        {
            name:'coordinates',
            index:'coordinates',
            width:90
        },

        {
            name:'title',
            index:'title',
            width:100
        }],
        rowNum:15,
        //rowList:[5,10,15],
        pager: '#marker-table-nav',
        multiselect: true,
        caption: "Information of all the markers on the Map"
    });
    $("#marker-table").jqGrid('navGrid','#marker-table-nav',{
        edit:false,
        add:false,
        del:false
    });
};
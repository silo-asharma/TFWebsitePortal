
var ProductName = "";
var countriesGDPgdp = '';
var countriesGDP = '';
$(getdata);
function getdata() {

    transferdata();
}
$(function () {
    
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "productsearch.aspx/GetListofCountriesexportimport",
        data: JSON.stringify({ ProductName: ProductName }),
        dataType: "json",
        success: function (data) {
            if (data.d.length > 0) {
            
                var items = data.d;
            
                $.each(items, function (index, val) {

                    var Country = val.Country;
                    var Exportdata = val.ExportData;
                    var ImportData = val.ImportData;
                    countriesGDPgdp = countriesGDPgdp + "\"" + Country + "\"" + ':  {"Export": ' + Exportdata + ' , "import": ' + ImportData + '},';
                });

                //$.each(items, function (index, val) {

                //    a = "\"" + val.Country + "\"";
                //    arrExportimportLabels.push(a);
                //    brrTotalvalueExport.push(val.ExportData);
                //    brrTotalvalueImport.push(val.ExportData);
                //});

               

                countriesGDPgdp = '{' + countriesGDPgdp.replace(/,\s*$/, "") + '}';
                countriesGDP = JSON.parse(countriesGDPgdp);
            }
            else {
                response([{ label: 'No Records Found', val: -1 }]);
            }
        },
        error: function (result) {
          //  alert("Error");
        }
    });
});







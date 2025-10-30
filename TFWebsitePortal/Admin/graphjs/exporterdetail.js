app.controller('exporterdetail', function ($scope, $http) {

    $scope.maxSize = 5;     // Limit number for pagination display number.  
    $scope.totalCount = 0;  // Total number of items in all pages. initialize as a zero  
    $scope.pageIndex = 1;   // Current page number. First page is 1.-->  
    $scope.pageSizeSelected = 20; // Maximum number of items per page.  
    $scope.mode = mode;
    $scope.from = from;
    $scope.to = to;
    $scope.year = year;
    $scope.opt = opt;
    $scope.product = product.split(' ').join('_');
    $scope.mproduct = mproduct.split(' ').join('_');
    $scope.chapter = chapter;
    $scope.hscode = hscode;
    $scope.mhscode = mhscode.split(' ').join('_');
    $scope.importer = importer;
    $scope.exporter = exporter;
    $scope.port = port;
    $scope.country = country;
    $scope.unit = unit;


    $scope.Name = [];
    $scope.Total = [];
    $scope.unitexp = [];
    $scope.countrexp = [];
    $scope.portexp = [];
    $scope.monthexp = [];
    $scope.exports = [];
    $scope.hshexp = [];
    $scope.producthexp = [];
    var countrymaster = {};
    var countryseries = [];
    var postmaster = {};
    var portseries = [];
    var unitmaster = {};
    var uintseries = [];
    var importermaster = {};
    var importerseries = [];
    var exportermaster = {};
    var exporterseries = [];
    var hscodeMaster = {};
    var hscodeSeries = [];
    var imppieMaster = {};
    var imppieSeries = [];
    var countryimppieMaster = {};
    var countryimppieSeries = [];
    var portimppieMaster = {};
    var portimppieSeries = [];
    var monthexppieMaster = {};
    var monthexppieSeries = [];
    var hsexppieMaster = {};
    var hsexppieSeries = [];
    var productpieMaster = {};
    var productpieSeries = [];

    $scope.loadrecord = function () {
        
       
        $http.get("http://indiaexportimportdata.in/Search/GetExporter?type=json&pageIndex=" + $scope.pageIndex + "&pageSize=" + $scope.pageSizeSelected + "&mode=" + $scope.mode + "&from=" + $scope.from + "&to=" + $scope.to + "&year=" + $scope.year + "&opt=" + $scope.opt + "&product=" + $scope.product + "&mproduct=" + $scope.mproduct + "&chapter=" + $scope.chapter + "&hscode=" + $scope.hscode + "&mhscode=" + $scope.mhscode + "&importer=" + $scope.importer + "&exporter=" + $scope.exporter + "&port=" + $scope.port + "&country=" + $scope.country + "&unit=" + $scope.unit).then(



        //$http.get("http://indiaexportimportdata.in/api/GetExporter?type=json&pageIndex=" + $scope.pageIndex + "&pageSize=" + $scope.pageSizeSelected + "&mode=" + $scope.mode + "&from=" + $scope.from + "&to=" + $scope.to + "&year=" + $scope.year + "&product=" + $scope.product + "&chapter=" + $scope.chapter + "&hscode=" + $scope.hscode + "&importer=" + $scope.importer + "&exporter=ename" + $scope.ename + "&port=" + $scope.port + "&country=" + $scope.country + "&unit=" + $scope.unit).then(
      


            function (response) {


                $scope.Importers = response.data.CountryTotals;
                var importerchart = response.data.CountryTotals;

                if (importerchart != null) {



                    var i;
                    for (i = 0; i < importerchart.length; i++) {


                        if (typeof countrymaster[importerchart[i].name] === 'undefined') {
                            countrymaster[importerchart[i].name] = [];
                        }


                        countrymaster[importerchart[i].name].push(importerchart[i].total);

                        if ((i + 1) == importerchart.length) {
                            Object.keys(countrymaster).forEach(function (key) {
                                var countrymaster1 = {
                                    label: key,
                                    value: countrymaster[key]
                                };
                                countryseries.push(countrymaster1);
                            });
                        }
                    }

                }
                //----Port Chart--
                $scope.portt = response.data.PortTotals;
                var pchart = response.data.PortTotals;
                if (pchart != null) {
                    var j;
                    for (j = 0; j < pchart.length; j++) {


                        if (typeof postmaster[pchart[j].name] === 'undefined') {
                            postmaster[pchart[j].name] = [];
                        }


                        postmaster[pchart[j].name].push(pchart[j].total);

                        if ((j + 1) == pchart.length) {
                            Object.keys(postmaster).forEach(function (key) {
                                var postmaster1 = {
                                    label: key,
                                    value: postmaster[key]
                                };
                                portseries.push(postmaster1);
                            });
                        }
                    }
                }
                //----------Unit Chart------
                $scope.unt = response.data.UnitTotals;
                var uchart = response.data.UnitTotals;
                if (uchart != null) {

                    var k;
                    for (k = 0; k < uchart.length; k++) {


                        if (typeof unitmaster[uchart[k].name] === 'undefined') {
                            unitmaster[uchart[k].name] = [];
                        }


                        unitmaster[uchart[k].name].push(uchart[k].total);

                        if ((k + 1) == uchart.length) {
                            Object.keys(unitmaster).forEach(function (key) {
                                var unitmaster1 = {
                                    label: key,
                                    value: unitmaster[key]
                                };
                                uintseries.push(unitmaster1);
                            });
                        }
                    }
                }

                //----------Importer Chart------
                $scope.uimp = response.data.Importers;

                var ichart = response.data.Importers;
                if (ichart != null) {
                    var m;
                    for (m = 0; m < ichart.length; m++) {


                        if (typeof importermaster[ichart[m].name] === 'undefined') {
                            importermaster[ichart[m].name] = [];
                        }


                        importermaster[ichart[m].name].push(ichart[m].total);

                        if ((m + 1) == ichart.length) {
                            Object.keys(importermaster).forEach(function (key) {
                                var importermaster1 = {
                                    label: key,
                                    value: importermaster[key]
                                };
                                importerseries.push(importermaster1);
                            });
                        }
                    }
                }

                //----------Exporter Chart------
                $scope.uexp = response.data.Consinees;
                var echart = response.data.Consinees;
                if (echart != null) {
                    var n;
                    for (n = 0; n < echart.length; n++) {


                        if (typeof exportermaster[echart[n].name] === 'undefined') {
                            exportermaster[echart[n].name] = [];
                        }


                        exportermaster[echart[n].name].push(echart[n].total);

                        if ((n + 1) == echart.length) {
                            Object.keys(exportermaster).forEach(function (key) {
                                var exportermaster1 = {
                                    label: key,
                                    value: exportermaster[key]
                                };
                                exporterseries.push(exportermaster1);
                            });
                        }
                    }
                }
                //----------Hscode Chart------
                $scope.uhs = response.data.MonthNameTotals;
                var hschart = response.data.MonthNameTotals;
                if (hschart != null) {
                    var p;
                    for (p = 0; p < hschart.length; p++) {


                        if (typeof hscodeMaster[hschart[p].name] === 'undefined') {
                            hscodeMaster[hschart[p].name] = [];
                        }


                        hscodeMaster[hschart[p].name].push(hschart[p].total);

                        if ((p + 1) == hschart.length) {
                            Object.keys(hscodeMaster).forEach(function (key) {
                                var hscodeMaster1 = {
                                    label: key,
                                    value: hscodeMaster[key]
                                };
                                hscodeSeries.push(hscodeMaster1);
                            });
                        }
                    }
                }

            },

            function (err) {
                var error = err;
            });
    };

    //Loading employees list on first time


    //Loading employees list on first time
    $scope.exporterdetail();
    const SingleExporterdataSource = {
        chart: {


            "theme": "fusion",
            "caption": "Exporter's",
            "subcaption": " Total value In USD ",

            "formatnumberscale": "0",
            "maxLabelWidthPercent": "5",
            "valueBorderPadding": "5",
            "labelBinSize": "10",
            "maxBarHeight": "40", "width": "100%",
            "height": "100%",
            "showpercentvalues": "1",
            "showpercentintooltip": "0",
            "enableslicing": "0",
            "xAxisMaxValue": "2500000",
            "yAxisMinValue": "1000000", "showLabels": "0",
            "legendscrollbgcolor": "#ffffff",
            "bgcolor": "#ffffff", "palettecolors": "5d62b5,29c3be,f2726f",
            "width": "100%",
            "height": "100%",
            "toolTipBgColor": "#000",
            "toolTipColor": "#fff",
            "toolTipPadding": "10",
            "plotToolText": "Exporter: $label <br> Value in (USD): $dataValue <br> $displayValue",
            "toolTipPadding": "10",
            "showToolTipShadow": "1",
            "toolTipBorderColor": "#000",
            "tooltipborderradius": "5",


        },


        "data": exporterseries
    };

    $scope.mySingleExporterdataSource = SingleExporterdataSource

    //----hscode------
    const hscExporterdataSource = {
        chart: {


            "theme": "fusion",
            "caption": "Hs Code's",
            "subcaption": " Total value In USD ",

            "formatnumberscale": "0",
            "maxLabelWidthPercent": "15",
            "valueBorderPadding": "15",
            "labelBinSize": "10",
            "maxBarHeight": "40",
            "showpercentvalues": "1",
            "showpercentintooltip": "0",
            "enableslicing": "0",
            "legendscrollbgcolor": "#ffffff",
            "bgcolor": "#ffffff",
            "width": "100%",
            "height": "100%",
            "toolTipBgColor": "#000",
            "toolTipColor": "#fff",
            "toolTipPadding": "10",
            "plotToolText": "Hs Code: $label <br> Value in (USD): $dataValue <br> $displayValue",

            "showToolTipShadow": "1",
            "toolTipBorderColor": "#000",
            "tooltipborderradius": "5",


        },


        "data": hsexppieSeries
    };

    $scope.myhscExporterdataSource = hscExporterdataSource

    //-----product------------

    const productExporterdataSource = {
        chart: {


            "theme": "fusion",
            "caption": "Product's",
            "subcaption": " Total value In USD ",

            "legendItemFontSize": "13",
            "legendposition": "right",

            "legendCaptionAlignment": "right",
            "legendItemHoverFontColor": "#000",
            "legendCaptionFontColor": "1",
            "legendIconAlpha": "80",
            "usedataplotcolorforlabels": "1",
            "disableSmartLabels": "1",
            "smartLineColor": "#000",
            "showLabels": "0",
            "showValues": "0",
            "slicingDistance": "10",
            "toolTipBgColor": "#000",
            "toolTipColor": "#fff",
            "toolTipPadding": "10",
            "showToolTipShadow": "1",
            "toolTipBorderColor": "#000",
            "tooltipborderradius": "5",
            "plotToolText": "Product: $label <br> Value in (USD): $dataValue <br> $displayValue",
            "plotHoverEffect": "1",


        },


        "data": productpieSeries
    };

    $scope.myprodcExporterdataSource = productExporterdataSource


    const myeImporterdataSource = {
        chart: {


            "theme": "fusion",
            "caption": "Unit",
            "subcaption": " Total value In USD ",
            "legendItemFontSize": "13",
            "legendposition": "right",

            "legendCaptionAlignment": "right",
            "legendItemHoverFontColor": "#000",
            "legendCaptionFontColor": "1",
            "legendIconAlpha": "80",
            "usedataplotcolorforlabels": "1",
            "disableSmartLabels": "1",
            "smartLineColor": "#000",
            "showLabels": "0",
            "showValues": "0",
            "slicingDistance": "10",
            "toolTipBgColor": "#000",
            "toolTipColor": "#fff",
            "toolTipPadding": "10",
            "showToolTipShadow": "1",
            "toolTipBorderColor": "#000",
            "tooltipborderradius": "5",
            "plotToolText": "Unit: $label <br> Value in (USD): $dataValue <br> $displayValue",
            "plotHoverEffect": "1",


        },


        "data": imppieSeries
    };

    $scope.myPieImporterdataSource = myeImporterdataSource


    //Loading employees list on first time

    const SingleImporterdataSource = {
        chart: {


            "theme": "fusion",
            "caption": "Importer's",
            "subcaption": " Total value In USD ",
            "formatnumberscale": "0",
            "maxLabelWidthPercent": "15",
            "valueBorderPadding": "15",
            "labelBinSize": "10",
            "maxBarHeight": "40",
            "showpercentvalues": "1",
            "showpercentintooltip": "0",
            "enableslicing": "0",
            "legendscrollbgcolor": "#ffffff",
            "bgcolor": "#ffffff",
            "width": "100%",
            "height": "100%",
            "toolTipBgColor": "#000",
            "toolTipColor": "#fff",
            "toolTipPadding": "10",
            "showToolTipShadow": "1",
            "toolTipBorderColor": "#000",
            "tooltipborderradius": "5",
            "plotToolText": "Importers: $label <br> Value in (USD): $dataValue <br> $displayValue",

        },


        "data": importerseries
    };

    $scope.mySingleImporterdataSource = SingleImporterdataSource

    //country----------------------------

    const CountryImporterdataSource = {
        chart: {


            "theme": "fusion",
            "caption": "Country",
            "subcaption": " Total value In USD ",
            "legendItemFontSize": "13",
            "legendposition": "right",

            "legendCaptionAlignment": "right",
            "legendItemHoverFontColor": "#000",
            "legendCaptionFontColor": "1",
            "legendIconAlpha": "80",
            "usedataplotcolorforlabels": "1",
            "disableSmartLabels": "1",
            "smartLineColor": "#000",
            "showLabels": "0",
            "showValues": "0",
            "slicingDistance": "10",
            "toolTipBgColor": "#000",
            "toolTipColor": "#fff",
            "toolTipPadding": "10",
            "showToolTipShadow": "1",
            "toolTipBorderColor": "#000",
            "tooltipborderradius": "5",
            "plotToolText": "Country: $label <br> Value in (USD): $dataValue <br> $displayValue",
            "plotHoverEffect": "1",



        },


        "data": countryimppieSeries
    };

    $scope.myCountryImporterdataSource = CountryImporterdataSource

    //Month--------------------------
    const monthExporterdataSource = {
        chart: {


            "theme": "fusion",
            "caption": "Importer's",
            "subcaption": " Total value In USD ",
            "legendItemFontSize": "13",
            "legendposition": "right",

            "legendCaptionAlignment": "right",
            "legendItemHoverFontColor": "#000",
            "legendCaptionFontColor": "1",
            "legendIconAlpha": "80",
            "usedataplotcolorforlabels": "1",
            "disableSmartLabels": "1",
            "smartLineColor": "#000",
            "showLabels": "0",
            "showValues": "0",
            "slicingDistance": "10",
            "toolTipBgColor": "#000",
            "toolTipColor": "#fff",
            "toolTipPadding": "10",
            "showToolTipShadow": "1",
            "toolTipBorderColor": "#000",
            "tooltipborderradius": "5",
            "plotToolText": "Importer: $label <br> Value in (USD): $dataValue <br> $displayValue",
            "plotHoverEffect": "1",



        },


        "data": monthexppieSeries
    };

    $scope.mymonthExporterdataSource = monthExporterdataSource

    //port-----------------------
    const PortImporterdataSource = {
        chart: {


            "theme": "fusion",
            "caption": "Port",
            "subcaption": " Total value In USD ",
            "legendItemFontSize": "13",
            "legendposition": "right",

            "legendCaptionAlignment": "right",
            "legendItemHoverFontColor": "#000",
            "legendCaptionFontColor": "1",
            "legendIconAlpha": "80",
            "usedataplotcolorforlabels": "1",
            "disableSmartLabels": "1",
            "smartLineColor": "#000",
            "showLabels": "0",
            "showValues": "0",
            "slicingDistance": "10",
            "toolTipBgColor": "#000",
            "toolTipColor": "#fff",
            "toolTipPadding": "10",
            "showToolTipShadow": "1",
            "toolTipBorderColor": "#000",
            "tooltipborderradius": "5",
            "plotToolText": "Port: $label <br> Value in (USD): $dataValue <br> $displayValue",
            "plotHoverEffect": "1",



        },


        "data": portimppieSeries
    };

    $scope.myportImporterdataSource = PortImporterdataSource



});

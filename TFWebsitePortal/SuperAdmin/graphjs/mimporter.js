app.controller('ImporterCtrl', function ($scope, $http) {

    $scope.maxSize = 5;     // Limit number for pagination display number.  
    $scope.totalCount = 0;  // Total number of items in all pages. initialize as a zero  
    $scope.pageIndex = 1;   // Current page number. First page is 1.-->  
    $scope.pageSizeSelected = 10; // Maximum number of items per page.  
    $scope.mode = mode;
    $scope.from = from;
    $scope.to = to;
    $scope.year = year;
    $scope.header = header;
    $scope.keyword = keyword;

    $scope.Name = [];
    $scope.Total = [];
    $scope.unitpie = [];
    $scope.countrytpie = [];
    $scope.portpie = [];
    $scope.monthtpie = [];
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
    var monthimppieMaster = {};
    var monthimppieSeries = [];

    $scope.getImporterGraph = function () {


        

        $http.get("http://indiaexportimportdata.in/Search/MGetimporterlist?pageIndex=" + $scope.pageIndex + "&pageSize=" + $scope.pageSizeSelected + "&mode=" + $scope.mode + "&year=" + $scope.year + "&from=" + $scope.from + "&to=" + $scope.to + "&header=" + $scope.header + "&keyword=" + $scope.keyword).then(


            function (response) {

 
                $scope.importers = response.data.Importers;
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
                //import---------------------column

                $scope.unitpie = response.data.UnitTotals;

                var pichart = response.data.UnitTotals;
                if (pichart != null) {
                    var s;
                    for (s = 0; s < pichart.length; s++) {


                        if (typeof imppieMaster[pichart[s].name] === 'undefined') {
                            imppieMaster[pichart[s].name] = [];
                        }


                        imppieMaster[pichart[s].name].push(pichart[s].total);

                        if ((s + 1) == pichart.length) {
                            Object.keys(imppieMaster).forEach(function (key) {
                                var imppieMaster1 = {
                                    label: key,
                                    value: imppieMaster[key]
                                };
                                imppieSeries.push(imppieMaster1);
                            });
                        }
                    }
                }
                //country-------------------------

                $scope.countrytpie = response.data.CountryTotals;

                var picounchart = response.data.CountryTotals;
                if (picounchart != null) {
                    var e;
                    for (e = 0; e < picounchart.length; e++) {


                        if (typeof countryimppieMaster[picounchart[e].name] === 'undefined') {
                            countryimppieMaster[picounchart[e].name] = [];
                        }


                        countryimppieMaster[picounchart[e].name].push(picounchart[e].total);

                        if ((e + 1) == picounchart.length) {
                            Object.keys(countryimppieMaster).forEach(function (key) {
                                var countryimppieMaster1 = {
                                    label: key,
                                    value: countryimppieMaster[key]
                                };
                                countryimppieSeries.push(countryimppieMaster1);
                            });
                        }
                    }
                }
                //portwise--------------------------------

                $scope.portpie = response.data.PortTotals;

                var portounchart = response.data.PortTotals;
                if (portounchart != null) {
                    var e;
                    for (e = 0; e < portounchart.length; e++) {


                        if (typeof portimppieMaster[portounchart[e].name] === 'undefined') {
                            portimppieMaster[portounchart[e].name] = [];
                        }


                        portimppieMaster[portounchart[e].name].push(portounchart[e].total);

                        if ((e + 1) == portounchart.length) {
                            Object.keys(portimppieMaster).forEach(function (key) {
                                var portimppieMaster1 = {
                                    label: key,
                                    value: portimppieMaster[key]
                                };
                                portimppieSeries.push(portimppieMaster1);
                            });
                        }
                    }
                }
                //month---------------wise---

                $scope.monthtpie = response.data.MonthNameTotals;

                var monthounchart = response.data.MonthNameTotals;
                if (monthounchart != null) {
                    var e;
                    for (e = 0; e < monthounchart.length; e++) {


                        if (typeof monthimppieMaster[monthounchart[e].name] === 'undefined') {
                            monthimppieMaster[monthounchart[e].name] = [];
                        }


                        monthimppieMaster[monthounchart[e].name].push(monthounchart[e].total);

                        if ((e + 1) == monthounchart.length) {
                            Object.keys(monthimppieMaster).forEach(function (key) {
                                var monthimppieMaster1 = {
                                    label: key,
                                    value: monthimppieMaster[key]
                                };
                                monthimppieSeries.push(monthimppieMaster1);
                            });
                        }
                    }
                }
                //----------Exporter Chart------


            },

            function (err) {
                var error = err;
            });


    }

    //Loading employees list on first time
    const myeImporterdataSource = {
        chart: {


            "theme": "fusion",
            "caption": "Unit",
            "subcaption": " Sum of Qty. ",
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
            "plotToolText": "Unit: $label <br> Sum of Qty: $dataValue <br> $displayValue",
            "toolTipPadding": "10",
            "showToolTipShadow": "1",
            "toolTipBorderColor": "#000",
            "tooltipborderradius": "5",

            "plotHoverEffect": "1",


        },


        "data": imppieSeries
    };

    $scope.myPieImporterdataSource = myeImporterdataSource


    //Loading employees list on first time

    const SingleImporterdataSource = {
        chart: {


            "theme": "fusion",
            "caption": "Importers",
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
            "yAxisMaxValue": "-5500000",
            "yAxisMinValue": "700000", "showLabels": "0",
            "legendscrollbgcolor": "#ffffff",
            "bgcolor": "#ffffff", "palettecolors": "5d62b5,29c3be,f2726f",
            "width": "100%",
            "height": "100%",
            "toolTipBgColor": "#000",
            "toolTipColor": "#fff",
            "toolTipPadding": "10",
            "plotToolText": "Importers: $label <br>  Value in (USD): $dataValue <br> $displayValue",
            "showToolTipShadow": "1",
            "toolTipBorderColor": "#000",
            "tooltipborderradius": "5",


        },


        "data": importerseries
    };

    $scope.mySingleImporterdataSource = SingleImporterdataSource

    //country----------------------------

    const CountryImporterdataSource = {
        chart: {


            "theme": "fusion",
            "caption": "Country ",
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
            "plotToolText": "Country: $label <br>  Value in (USD): $dataValue <br> $displayValue",
            "toolTipBorderColor": "#000",
            "tooltipborderradius": "5",

            "plotHoverEffect": "1",



        },


        "data": countryimppieSeries
    };

    $scope.myCountryImporterdataSource = CountryImporterdataSource

    //Month--------------------------
    const monthImporterdataSource = {
        chart: {


            "theme": "fusion",
            "caption": "Month",
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
            "plotToolText": "Month: $label <br>  Value in (USD): $dataValue <br> $displayValue",
            "showToolTipShadow": "1",
            "toolTipBorderColor": "#000",
            "tooltipborderradius": "5",

            "plotHoverEffect": "1",



        },


        "data": monthimppieSeries
    };

    $scope.mymonthImporterdataSource = monthImporterdataSource

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
            "plotToolText": "Port: $label <br>  Value in (USD): $dataValue <br> $displayValue",
            "showToolTipShadow": "1",
            "toolTipBorderColor": "#000",
            "tooltipborderradius": "5",

            "plotHoverEffect": "1",



        },


        "data": portimppieSeries
    };

    $scope.myportImporterdataSource = PortImporterdataSource


    $scope.getImporterGraph();

});

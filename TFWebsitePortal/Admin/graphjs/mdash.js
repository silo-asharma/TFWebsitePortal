app.controller('dashboardctrl', function ($scope, $http) {

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

    $scope.getDashboardGraph = function () {
        


        $http.get("http://indiaexportimportdata.in/Search/MGetDashboardlist?pageIndex=" + $scope.pageIndex + "&pageSize=" + $scope.pageSizeSelected + "&mode=" + $scope.mode + "&year=" + $scope.year + "&from=" + $scope.from + "&to=" + $scope.to + "&header=" + $scope.header + "&keyword=" + $scope.keyword).then(


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


    }

    //Loading employees list on first time
    $scope.getDashboardGraph();
    const dataSource = {
        chart: {


            "theme": "fusion",
            "caption": "Country of Origin",
            "subcaption": "Top Country of Origin",

            "captionFontColor": "#000",
            "subcaptionFontSize": "13",
            "captionHorizontalPadding": "25px",

            "subcaptionPadding": "10",
            "subcaptionFontColor": "#993300",
            "subcaptionFontBold": "0",

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
            "plotToolText": "Country: $label <br> Value in (USD): $dataValue <br> $displayValue",
            "showToolTipShadow": "1",
            "toolTipBorderColor": "#000",
            "tooltipborderradius": "5",

            "plotHoverEffect": "1",








        },


        "data": countryseries
    };

    $scope.myDataSource = dataSource

    const countrydataSource = {
        chart: {


            "theme": "fusion",
            "caption": "Ports",
            "subcaption": "Total Value In USD",
            "showlegend": "1",

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
            "plotToolText": "Ports: $label <br>  Value in (USD): $dataValue <br> $displayValue",
            "showToolTipShadow": "1",
            "toolTipBorderColor": "#000",
            "tooltipborderradius": "5",

            "plotHoverEffect": "1",



        },


        "data": portseries
    };

    $scope.myCountrySource = countrydataSource


    const UnitdataSource = {
        chart: {


            "theme": "fusion",
            "caption": "Units",
            "subcaption": " Sum of Qty ",
            "showlegend": "1",

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
            "plotToolText": "Units: $label <br>  sum of Qty.: $dataValue <br> $displayValue",
            "toolTipBorderColor": "#000",
            "tooltipborderradius": "5",

            "plotHoverEffect": "1",



        },


        "data": uintseries
    };

    $scope.myUnitdataSource = UnitdataSource


    const ImporterdataSource = {


        chart: {


            "theme": "fusion",
            "caption": "Importers",
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
            "plotToolText": "Importers: $label <br>  Value in (USD): $dataValue <br> $displayValue",
            "showToolTipShadow": "1",
            "toolTipBorderColor": "#000",
            "tooltipborderradius": "5",

            "plotHoverEffect": "1",



        },


        "data": importerseries
    };

    $scope.myImporterdataSource = ImporterdataSource

    const ExporterdataSource = {
        chart: {


            "theme": "fusion",
            "caption": "Exporter",
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
            "plotToolText": "Exporter: $label <br>  Value in (USD): $dataValue <br> $displayValue",
            "showToolTipShadow": "1",
            "toolTipBorderColor": "#000",
            "tooltipborderradius": "5",

            "plotHoverEffect": "1",


        },


        "data": exporterseries
    };

    $scope.myExporterdataSource = ExporterdataSource


    const HsCodedataSource = {
        chart: {


            "theme": "fusion",
            "caption": "Month",
            "subcaption": " Total Value In USD ",
            "legendCaptionFontSize": "6",
            "legendposition": "right",

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


        "data": hscodeSeries
    };

    $scope.myHsCodedataSource = HsCodedataSource



});

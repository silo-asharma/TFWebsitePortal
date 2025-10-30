app.controller('impoterCTRL', function ($scope, $http) {

    $scope.maxSize = 5;     // Limit number for pagination display number.  
    $scope.totalCount = 0;  // Total number of items in all pages. initialize as a zero  
    $scope.pageIndex = 1;   // Current page number. First page is 1.-->  
    $scope.pageSizeSelected = 25; // Maximum number of items per page.  
    $scope.mode = mode;
    $scope.from = from;
    $scope.to = to;
    $scope.year = year;
    $scope.opt = opt;
    $scope.product = product.split(' ').join('_').trim();
    $scope.mproduct = mproduct.split(' ').join('_').trim();
    $scope.chapter = chapter;
    $scope.hscode = hscode;
    $scope.mhscode = mhscode.split(' ').join('_');
    $scope.importer = importer.split(' ').join('_').trim();
    $scope.exporter = exporter.split(' ').join('_').trim();
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
    $scope.getSupplierGraph = function () {

       
        $http.get("http://indiaexportimportdata.in/Search/Getimpdata?type=json&pageIndex=" + $scope.pageIndex + "&pageSize=" + $scope.pageSizeSelected + "&mode=" + $scope.mode + "&from=" + $scope.from + "&to=" + $scope.to + "&year=" + $scope.year + "&opt=" + $scope.opt + "&product=" + $scope.product + "&mproduct=" + $scope.mproduct + "&chapter=" + $scope.chapter + "&hscode=" + $scope.hscode + "&mhscode=" + $scope.mhscode + "&importer=" + $scope.importer + "&exporter=" + $scope.exporter + "&port=" + $scope.port + "&country=" + $scope.country + "&unit=" + $scope.unit).then(



        //$http.get("http://indiaexportimportdata.in/api/Getimpdata?type=json&pageIndex=" + $scope.pageIndex + "&pageSize=" + $scope.pageSizeSelected + "&mode=" + $scope.mode + "&from=" + $scope.from + "&to=" + $scope.to + "&year=" + $scope.year + "&product=" + $scope.product + "&mproduct=" + $scope.mproduct + "&chapter=" + $scope.chapter + "&hscode=" + $scope.hscode + "&mhscode=" + $scope.mhscode + "&importer=" + $scope.importer + "&exporter=" + $scope.exporter + "&port=" + $scope.port + "&country=" + $scope.country + "&unit=" + $scope.unit).then(


            function (response) {



                $scope.exports = response.data.ExDdetails;

                var Exchart = response.data.ExDdetails;
                if (Exchart != null) {
                    var p;
                    for (p = 0; p < Exchart.length; p++) {


                        if (typeof exportermaster[Exchart[p].name] === 'undefined') {
                            exportermaster[Exchart[p].name] = [];
                        }


                        exportermaster[Exchart[p].name].push(Exchart[p].total);

                        if ((p + 1) == Exchart.length) {
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
                //import---------------------column

                $scope.unitpie = response.data.Unitdetails;

                var pichart = response.data.Unitdetails;
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

                $scope.countrytpie = response.data.countryDetails;

                var picounchart = response.data.countryDetails;
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

                $scope.portpie = response.data.portdetails;

                var portounchart = response.data.portdetails;
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

                $scope.monthexp = response.data.impdetails;

                var monthexpvar = response.data.impdetails;
                if (monthexpvar != null) {
                    var p;
                    for (p = 0; p < monthexpvar.length; p++) {


                        if (typeof monthexppieMaster[monthexpvar[p].name] === 'undefined') {
                            monthexppieMaster[monthexpvar[p].name] = [];
                        }


                        monthexppieMaster[monthexpvar[p].name].push(monthexpvar[p].total);

                        if ((p + 1) == monthexpvar.length) {
                            Object.keys(monthexppieMaster).forEach(function (key) {
                                var monthexppieMaster1 = {
                                    label: key,
                                    value: monthexppieMaster[key]
                                };
                                monthexppieSeries.push(monthexppieMaster1);
                            });
                        }
                    }
                }
                //-----------------------hscode-----------------

                $scope.hshexp = response.data.hscodeDetails;

                var hsexpvar = response.data.hscodeDetails;
                if (hsexpvar != null) {
                    var h;
                    for (h = 0; h < hsexpvar.length; h++) {


                        if (typeof hsexppieMaster[hsexpvar[h].name] === 'undefined') {
                            hsexppieMaster[hsexpvar[h].name] = [];
                        }


                        hsexppieMaster[hsexpvar[h].name].push(hsexpvar[h].total);

                        if ((h + 1) == hsexpvar.length) {
                            Object.keys(hsexppieMaster).forEach(function (key) {
                                var hsexppieMaster1 = {
                                    label: key,
                                    value: hsexppieMaster[key]
                                };
                                hsexppieSeries.push(hsexppieMaster1);
                            });
                        }
                    }
                }
                //----product---------------


                $scope.producthexp = response.data.productDetails;

                var productexpvar = response.data.productDetails;
                if (productexpvar != null) {
                    var c;
                    for (c = 0; c < productexpvar.length; c++) {


                        if (typeof productpieMaster[productexpvar[c].name] === 'undefined') {
                            productpieMaster[productexpvar[c].name] = [];
                        }


                        productpieMaster[productexpvar[c].name].push(productexpvar[c].total);

                        if ((c + 1) == productexpvar.length) {
                            Object.keys(productpieMaster).forEach(function (key) {
                                var productpieMaster1 = {
                                    label: key,
                                    value: productpieMaster[key]
                                };
                                productpieSeries.push(productpieMaster1);
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


    //Loading employees list on first time
    $scope.getSupplierGraph();
    const SingleExporterdataSource = {
        chart: {


            "theme": "fusion",
            "caption": "Importer's",
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
            "plotToolText": "Importer: $label <br> Value in (USD): $dataValue <br> $displayValue",
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
            "caption": "Exporter's",
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
            "plotToolText": "Exporter: $label <br> Value in (USD): $dataValue <br> $displayValue",

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
            "caption": "Exporter's",
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
            "plotToolText": "Exporter: $label <br> Value in (USD): $dataValue <br> $displayValue",
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

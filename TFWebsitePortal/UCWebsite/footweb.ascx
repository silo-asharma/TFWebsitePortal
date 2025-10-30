<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="footweb.ascx.cs" Inherits="Extuent.UCWebsite.footnew" %>
<script>
    $('.slider').slick({
        autoplay: true,
        speed: 1000,
        lazyLoad: 'progressive',
        arrows: false,
        dots: true,
        fade:true,
    }).slickAnimation();

    $(function () {
        $('.popup-youtube, .popup-vimeo').magnificPopup({
            disableOn: 700,
            type: 'iframe',
            mainClass: 'mfp-fade',
            removalDelay: 160,
            preloader: false,
            fixedContentPos: false
           
        });
    });
</script>
<ul class="sticky-buttons -right-center -rsquare -medium -space" id="sticky-buttons-1">
    <li><a href="contact"><span class="sb-icon jki jki-envelope"></span><span class="sb-label">Contact Us</span></a></li>
</ul>
<link rel='stylesheet' id='jeg-dynamic-style-css' href='wp-content/plugins/jeg-elementor-kit/lib/jeg-framework/assets/css/jeg-dynamic-styles077c.css?ver=1.2.9' media='all' />
<link rel='stylesheet' id='sweetalert2-css' href='wp-content/plugins/jeg-elementor-kit/assets/js/sweetalert2/sweetalert2.min430c.css?ver=11.6.16' media='all' />
<link rel='stylesheet' id='sticky-buttons-fontawesome-css' href='wp-content/plugins/sticky-buttons/vendors/fontawesome/css/fontawesome-all.min52d5.css?ver=5.15.3' media='all' />
<link rel='stylesheet' id='sticky-buttons-css' href='wp-content/plugins/sticky-buttons/public/assets/css/style.min128b.css?ver=3.1' media='all' />
<style id='sticky-buttons-inline-css'>
    #sticky-buttons-1 {
        z-index: 9;
    }

    @media(max-width: 767px) {

        .elementor-2020 .elementor-element.elementor-element-420ead2 .jeg-elementor-kit.jkit-heading .heading-title {
            font-size: 25px !important;
        }
    }
        #sticky-buttons-1 li:nth-child(1) .sb-icon {
            color: rgb(255,104,0);
            background: rgb(255,255,255);
        }

        #sticky-buttons-1 li:nth-child(1) .sb-label {
            color: rgb(255,255,255);
            background: rgb(255,104,0);
        }

        #sticky-buttons-1 li:nth-child(1):hover .sb-icon {
            color: rgb(255,255,255);
            background: rgb(255,104,0);
        }
</style>
<link rel='stylesheet' id='e-animations-css' href='wp-content/plugins/elementor/assets/lib/animations/animations.minfb6f.css?ver=3.12.1' media='all' />
<script src='wp-content/themes/hello-elementor/assets/js/hello-frontend.min8a54.js?ver=1.0.0' id='hello-theme-frontend-js'></script>
<script src='wp-content/plugins/elementor/assets/js/webpack.runtime.minfb6f.js?ver=3.12.1' id='elementor-webpack-runtime-js'></script>
<script src='wp-content/plugins/elementor/assets/js/frontend-modules.minfb6f.js?ver=3.12.1' id='elementor-frontend-modules-js'></script>
<script src='wp-content/plugins/elementor/assets/lib/waypoints/waypoints.min05da.js?ver=4.0.2' id='elementor-waypoints-js'></script>
<script src='../wp-includes/js/jquery/ui/core.min3f14.js?ver=1.13.2' id='jquery-ui-core-js'></script>
<script id='elementor-frontend-js-before'>
    var elementorFrontendConfig = { "environmentMode": { "edit": false, "wpPreview": false, "isScriptDebug": false }, "i18n": { "shareOnFacebook": "Share on Facebook", "shareOnTwitter": "Share on Twitter", "pinIt": "Pin it", "download": "Download", "downloadImage": "Download image", "fullscreen": "Fullscreen", "zoom": "Zoom", "share": "Share", "playVideo": "Play Video", "previous": "Previous", "next": "Next", "close": "Close" }, "is_rtl": false, "breakpoints": { "xs": 0, "sm": 480, "md": 768, "lg": 1025, "xl": 1440, "xxl": 1600 }, "responsive": { "breakpoints": { "mobile": { "label": "Mobile Portrait", "value": 767, "default_value": 767, "direction": "max", "is_enabled": true }, "mobile_extra": { "label": "Mobile Landscape", "value": 880, "default_value": 880, "direction": "max", "is_enabled": false }, "tablet": { "label": "Tablet Portrait", "value": 1024, "default_value": 1024, "direction": "max", "is_enabled": true }, "tablet_extra": { "label": "Tablet Landscape", "value": 1200, "default_value": 1200, "direction": "max", "is_enabled": false }, "laptop": { "label": "Laptop", "value": 1366, "default_value": 1366, "direction": "max", "is_enabled": false }, "widescreen": { "label": "Widescreen", "value": 2400, "default_value": 2400, "direction": "min", "is_enabled": false } } }, "version": "3.12.1", "is_static": false, "experimentalFeatures": { "e_dom_optimization": true, "e_optimized_assets_loading": true, "e_optimized_css_loading": true, "a11y_improvements": true, "additional_custom_breakpoints": true, "theme_builder_v2": true, "hello-theme-header-footer": true, "landing-pages": true, "page-transitions": true, "notes": true, "loop": true, "form-submissions": true, "e_scroll_snap": true }, "urls": { "assets": "..\/wp-content\/plugins\/elementor\/assets\/" }, "swiperClass": "swiper-container", "settings": { "page": [], "editorPreferences": [] }, "kit": { "active_breakpoints": ["viewport_mobile", "viewport_tablet"], "global_image_lightbox": "yes", "lightbox_enable_counter": "yes", "lightbox_enable_fullscreen": "yes", "lightbox_enable_zoom": "yes", "lightbox_enable_share": "yes", "lightbox_title_src": "title", "lightbox_description_src": "description", "hello_header_logo_type": "title", "hello_header_menu_layout": "horizontal", "hello_footer_logo_type": "logo" }, "post": { "id": 2020, "title": "extuent.ai%20-%20Extuent", "excerpt": "", "featuredImage": false } };
</script>
<script src='wp-content/plugins/elementor/assets/js/frontend.minfb6f.js?ver=3.12.1' id='elementor-frontend-js'></script>
<script id='elementor-frontend-js-after'>
    var jkit_ajax_url = "../?jkit-ajax-request=jkit_elements", jkit_nonce = "45fde15808";
</script>
<script src='wp-content/plugins/jeg-elementor-kit/assets/js/elements/sticky-elementc141.js?ver=2.6.1' id='jkit-sticky-element-js'></script>
<script src='wp-content/plugins/jeg-elementor-kit/assets/js/elements/nav-menuc141.js?ver=2.6.1' id='jkit-element-navmenu-js'></script>
<script src='wp-content/plugins/jeg-elementor-kit/assets/js/elements/video-buttonc141.js?ver=2.6.1' id='jkit-element-videobutton-js'></script>
<script src='wp-content/plugins/jeg-elementor-kit/assets/js/sweetalert2/sweetalert2.min430c.js?ver=11.6.16' id='sweetalert2-js'></script>
<script src='wp-content/plugins/jeg-elementor-kit/assets/js/elements/fun-factc141.js?ver=2.6.1' id='jkit-element-funfact-js'></script>
<script src='wp-content/plugins/elementor-pro/assets/js/webpack-pro.runtime.minfb6f.js?ver=3.12.1' id='elementor-pro-webpack-runtime-js'></script>
<script src='../wp-includes/js/dist/vendor/wp-polyfill-inert.min0226.js?ver=3.1.2' id='wp-polyfill-inert-js'></script>
<script src='../wp-includes/js/dist/vendor/regenerator-runtime.min8fa4.js?ver=0.13.11' id='regenerator-runtime-js'></script>
<script src='../wp-includes/js/dist/vendor/wp-polyfill.min2c7c.js?ver=3.15.0' id='wp-polyfill-js'></script>
<script src='../wp-includes/js/dist/hooks.min6c65.js?ver=4169d3cf8e8d95a3d6d5' id='wp-hooks-js'></script>
<script src='../wp-includes/js/dist/i18n.mine57b.js?ver=9e794f35a71bb98672ae' id='wp-i18n-js'></script>
<script id='wp-i18n-js-after'>
    wp.i18n.setLocaleData({ 'text direction\u0004ltr': ['ltr'] });
</script>
<script id='elementor-pro-frontend-js-before'>
    var ElementorProFrontendConfig = { "ajaxurl": "https:\/\/cognuent.com\/wp-admin\/admin-ajax.php", "nonce": "73850ca3d0", "urls": { "assets": "..\/wp-content\/plugins\/elementor-pro\/assets\/", "rest": "https:\/\/cognuent.com\/wp-json\/" }, "shareButtonsNetworks": { "facebook": { "title": "Facebook", "has_counter": true }, "twitter": { "title": "Twitter" }, "linkedin": { "title": "LinkedIn", "has_counter": true }, "pinterest": { "title": "Pinterest", "has_counter": true }, "reddit": { "title": "Reddit", "has_counter": true }, "vk": { "title": "VK", "has_counter": true }, "odnoklassniki": { "title": "OK", "has_counter": true }, "tumblr": { "title": "Tumblr" }, "digg": { "title": "Digg" }, "skype": { "title": "Skype" }, "stumbleupon": { "title": "StumbleUpon", "has_counter": true }, "mix": { "title": "Mix" }, "telegram": { "title": "Telegram" }, "pocket": { "title": "Pocket", "has_counter": true }, "xing": { "title": "XING", "has_counter": true }, "whatsapp": { "title": "WhatsApp" }, "email": { "title": "Email" }, "print": { "title": "Print" } }, "facebook_sdk": { "lang": "en_US", "app_id": "" }, "lottie": { "defaultAnimationUrl": "..\/wp-content\/plugins\/elementor-pro\/modules\/lottie\/assets\/animations\/default.json" } };
</script>
<script src='wp-content/plugins/elementor-pro/assets/js/frontend.minfb6f.js?ver=3.12.1' id='elementor-pro-frontend-js'></script>
<script src='wp-content/plugins/elementor-pro/assets/js/elements-handlers.minfb6f.js?ver=3.12.1' id='pro-elements-handlers-js'></script>

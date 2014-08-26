var App = function () {

    var isIE8 = false; // IE8 mode
    var isIE9 = false;
    var isIE10 = false;

    // this function handles responsive layout on screen size resize or mobile device rotate.
    var handleResponsive = function () {
        if (jQuery.browser.msie && jQuery.browser.version.substr(0, 1) == 8) {
            isIE8 = true; // checkes for IE8 browser version
            $('.visible-ie8').show(); //
        }
        if (jQuery.browser.msie && jQuery.browser.version.substr(0, 1) == 9) {
            isIE9 = true;
        }

        isIE10 = !!navigator.userAgent.match(/MSIE 10/);

        if (isIE10) {
            jQuery('html').addClass('ie10'); // set ie10 class on html element.
        }

        // loops all page elements with "responsive" class and applied classes for tablet mode
        // For metornic  1280px or less set as tablet mode to display the content properly
        var handleTabletElements = function () {
            if ($(window).width() <= 1280) {
                $(".responsive").each(function () {
                    var forTablet = $(this).attr('data-tablet');
                    var forDesktop = $(this).attr('data-desktop');
                    if (forTablet) {
                        $(this).removeClass(forDesktop);
                        $(this).addClass(forTablet);
                    }
                });
                handleTooltip();
            }
        }

        // loops all page elements with "responsive" class and applied classes for desktop mode
        // For metornic  higher 1280px set as desktop mode to display the content properly
        var handleDesktopElements = function () {
            if ($(window).width() > 1280) {
                $(".responsive").each(function () {
                    var forTablet = $(this).attr('data-tablet');
                    var forDesktop = $(this).attr('data-desktop');
                    if (forTablet) {
                        $(this).removeClass(forTablet);
                        $(this).addClass(forDesktop);
                    }
                });
                handleTooltip();
            }
        }

        // handle all elements which require to re-initialize on screen width change(on resize or on rotate mobile device)
        var handleElements = function () {
            if ($(window).width() < 900) { // remove sidebar toggler
                $.cookie('sidebar-closed', null);
                $('.page-container').removeClass("sidebar-closed");
            }

            handleTabletElements();
            handleDesktopElements();
        }

        // handles responsive breakpoints.
        $(window).setBreakpoints({
            breakpoints: [320, 480, 768, 900, 1024, 1280]
        });

        $(window).bind('exitBreakpoint320', function () {
            handleElements();
        });
        $(window).bind('enterBreakpoint320', function () {
            handleElements();
        });

        $(window).bind('exitBreakpoint480', function () {
            handleElements();
        });
        $(window).bind('enterBreakpoint480', function () {
            handleElements();
        });

        $(window).bind('exitBreakpoint768', function () {
            handleElements();
        });
        $(window).bind('enterBreakpoint768', function () {
            handleElements();
        });

        $(window).bind('exitBreakpoint900', function () {
            handleElements();
        });
        $(window).bind('enterBreakpoint900', function () {
            handleElements();
        });

        $(window).bind('exitBreakpoint1024', function () {
            handleElements();
        });
        $(window).bind('enterBreakpoint1024', function () {
            handleElements();
        });

        $(window).bind('exitBreakpoint1280', function () {
            handleElements();
        });
        $(window).bind('enterBreakpoint1280', function () {
            handleElements();
        });
    }

    var handleMainMenu = function () {
        jQuery('.page-sidebar .has-sub > a').click(function () {

            var handleContentHeight = function () {
                var content = $('.page-content');
                var sidebar = $('.page-sidebar');

                if (!content.attr("data-height")) {
                    content.attr("data-height", content.height());
                }


                if (sidebar.height() > content.height()) {
                    content.css("min-height", sidebar.height() + 20);
                } else {
                    content.css("min-height", content.attr("data-height"));
                }
            }

            var last = jQuery('.has-sub.open', $('.page-sidebar'));
            if (last.size() == 0) {
                //last = jQuery('.has-sub.active', $('.page-sidebar'));
            }
            last.removeClass("open");
            jQuery('.arrow', last).removeClass("open");
            jQuery('.sub', last).slideUp(200);

            var sub = jQuery(this).next();
            if (sub.is(":visible")) {
                jQuery('.arrow', jQuery(this)).removeClass("open");
                jQuery(this).parent().removeClass("open");
                sub.slideUp(200, function () {
//                    handleContentHeight();
                });
            } else {
                jQuery('.arrow', jQuery(this)).addClass("open");
                jQuery(this).parent().addClass("open");
                sub.slideDown(200, function () {
//                    handleContentHeight();
                });
            }
        });
    }

    var handleSidebarToggler = function () {

        var container = $(".page-container");

        if ($.cookie('sidebar-closed') == 1) {
            container.addClass("sidebar-closed");
        }

        // handle sidebar show/hide
        $('.page-sidebar .sidebar-toggler').click(function () {
            $(".sidebar-search").removeClass("open");
            var container = $(".page-container");
            if (container.hasClass("sidebar-closed") === true) {
                container.removeClass("sidebar-closed");
                $.cookie('sidebar-closed', null);
            } else {
                container.addClass("sidebar-closed");
                $.cookie('sidebar-closed', 1);
            }
        });
    }

    var handlePortletTools = function () {
        jQuery('.portlet .tools a.remove').click(function () {
            var removable = jQuery(this).parents(".portlet");
            if (removable.next().hasClass('portlet') || removable.prev().hasClass('portlet')) {
                jQuery(this).parents(".portlet").remove();
            } else {
                jQuery(this).parents(".portlet").parent().remove();
            }
        });

        jQuery('.portlet .tools a.reload').click(function () {
            var el = jQuery(this).parents(".portlet");
            App.blockUI(el);
            window.setTimeout(function () {
                App.unblockUI(el);
            }, 1000);
        });

        jQuery('.portlet .tools .collapse, .portlet .tools .expand').click(function () {
            var el = jQuery(this).parents(".portlet").children(".portlet-body");
            if (jQuery(this).hasClass("collapse")) {
                jQuery(this).removeClass("collapse").addClass("expand");
                el.slideUp(200);
            } else {
                jQuery(this).removeClass("expand").addClass("collapse");
                el.slideDown(200);
            }
        });

    }

    var handleFixInputPlaceholderForIE = function () {
        //fix html5 placeholder attribute for ie7 & ie8
        if (jQuery.browser.msie && jQuery.browser.version.substr(0, 1) <= 9) { // ie7&ie8

            // this is html5 placeholder fix for inputs, inputs with placeholder-no-fix class will be skipped(e.g: we need this for password fields)
            jQuery('input[placeholder]:not(.placeholder-no-fix), textarea[placeholder]:not(.placeholder-no-fix)').each(function () {

                var input = jQuery(this);

                jQuery(input).addClass("placeholder").val(input.attr('placeholder'));

                jQuery(input).focus(function () {
                    if (input.val() == input.attr('placeholder')) {
                        input.val('');
                    }
                });

                jQuery(input).blur(function () {
                    if (input.val() == '' || input.val() == input.attr('placeholder')) {
                        input.val(input.attr('placeholder'));
                    }
                });
            });
        }
    }


    var handleTooltip = function () {
        if (App.isTouchDevice()) { // if touch device, some tooltips can be skipped in order to not conflict with click events
            jQuery('.tooltips:not(.no-tooltip-on-touch-device)').tooltip();
        } else {
            jQuery('.tooltips').tooltip();
        }
    }

    var handlePopover = function () {
        jQuery('.popovers').popover();
    }

    var handleChoosenSelect = function () {
        if (!jQuery().chosen) {
            return;
        }
        $(".chosen").chosen();

        $(".chosen-with-diselect").chosen({
            allow_single_deselect: true
        })
    }

    var initChosenSelect = function (els) {
        $(els).chosen({
            allow_single_deselect: true
        })
    }

    var handleUniform = function () {
        if (!jQuery().uniform) {
            return;
        }
        var test = $("input[type=checkbox]:not(.toggle), input[type=radio]:not(.toggle, .star)");
        if (test) {
            test.uniform();
        }
    }

    var initUniform = function (els) {
        jQuery(els).each(function () {
            if ($(this).parents(".checker").size() == 0) {
                $(this).show();
                $(this).uniform();
            }
        });
    }

    var handleWysihtml5 = function () {
        if (!jQuery().wysihtml5) {
            return;
        }

        if ($('.wysihtml5').size() > 0) {
            $('.wysihtml5').wysihtml5();
        }
    }

    var handleToggleButtons = function () {
        if (!jQuery().toggleButtons) {
            return;
        }
        $('.basic-toggle-button').toggleButtons();
        $('.text-toggle-button').toggleButtons({
            width: 200,
            label: {
                enabled: "Lorem Ipsum",
                disabled: "Dolor Sit"
            }
        });
        $('.danger-toggle-button').toggleButtons({
            style: {
                // Accepted values ["primary", "danger", "info", "success", "warning"] or nothing
                enabled: "danger",
                disabled: "info"
            }
        });
        $('.info-toggle-button').toggleButtons({
            style: {
                enabled: "info",
                disabled: ""
            }
        });
        $('.success-toggle-button').toggleButtons({
            style: {
                enabled: "success",
                disabled: "info"
            }
        });
        $('.warning-toggle-button').toggleButtons({
            style: {
                enabled: "warning",
                disabled: "info"
            }
        });

        $('.height-toggle-button').toggleButtons({
            height: 100,
            font: {
                'line-height': '100px',
                'font-size': '20px',
                'font-style': 'italic'
            }
        });
    }

    var handleTagsInput = function () {
        if (!jQuery().tagsInput) {
            return;
        }
        $('#tags_1').tagsInput({
            width: 'auto',
            'onAddTag': function () {
                alert(1);
            }
        });
        $('#tags_2').tagsInput({
            width: 240
        });
    }

    var handleAccordions = function () {
        $(".accordion").collapse().height('auto');

        var lastClicked;

        //add scrollable class name if you need scrollable panes
        jQuery('.accordion.scrollable .accordion-toggle').click(function () {
            lastClicked = jQuery(this);
        }); //move to faq section

        jQuery('.accordion.scrollable').on('shown', function () {
            jQuery('html,body').animate({
                scrollTop: lastClicked.offset().top - 150
            }, 'slow');
        });
    }

    var handleScrollers = function () {

        var setPageScroller = function () {
            $('.main').slimScroll({
                size: '12px',
                color: '#a1b2bd',
                height: $(window).height(),
                allowPageScroll: true,
                alwaysVisible: true,
                railVisible: true
            });
        }

        $('.scroller').each(function () {
            $(this).slimScroll({
                //start: $('.blah:eq(1)'),
                size: '7px',
                color: '#a1b2bd',
                height: $(this).attr("data-height"),
                alwaysVisible: ($(this).attr("data-always-visible") == "1" ? true : false),
                railVisible: ($(this).attr("data-rail-visible") == "1" ? true : false),
                disableFadeOut: true
            });
        });

    }

    var handleGoTop = function () {
        jQuery('.footer .go-top').click(function () {
            App.scrollTo();
        });
    }

    //关闭自定义弹出层
    var colseDIYWin = function () {
        $(".remove1").click(function () {
            $(this).closest(".diywindow").hide();
        });
    };

    //高度自适应
    var responsiveWindowHeight = function () {
        var winHeight = $(window).height();
        $(".page-content").css("min-height", winHeight - 97 + "px");
    };

    //dateTimepicker日历控件,没时间
    var handleDatePicker = function () {
        if ($(".form_date").length <= 0) {
            return;
        }
        $(".form_date").datetimepicker({
            language: 'zh-CN',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
    };

    //dateTimepicker日历控件,有时间
    var handleDateTimePicker = function () {
        if ($(".form_datetime").length <= 0) {
            return;
        }
        $(".form_datetime").datetimepicker({
            language: 'zh-CN',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            forceParse: 0,
            showMeridian: 1
        });
    };

    //portlet随机颜色
    var handleProLetRomColor = function () {
        var colors = ["blue", "light blue", "red", "yellow", "green", "purple", "light grey"];
        var prolet = $(".portlet");
        $.each(colors, function (i, item) {
            prolet.removeClass(item);
        });
        $.each(prolet, function (i, item) {
            if ($(item).find(".portlet-title").hasClass("line")) {
                return true;
            } else {
                var temp = parseInt(Math.random() * colors.length);
                $(item).addClass(colors[temp]);
            }

        })
    };

    //初始化同步提交form的validate
    var handleSyncFormValidate = function () {
        if ($(".form_sync").length != 0) {
            $.each($(".form_sync"), function (i, item) {
                $(item).validate();
            });
        }
    };

    //处理IE8,9重置form的清除placeholder的问题
    var handleResetForm = function () {
        $("form").bind("reset", function () {
            $.each($(this).find("input"), function (i, item) {
                $(item).val($(item).attr("placeholder"));
            });
            return false;
        });
    };

    //处理IE8,9placeholder字体颜色问题
    var handleBindEventPlaceHolderFontColorForIE = function () {
        $("input[placeholder]").live({
            keyup: handlePlaceHolderFontColorForIE,
            focus: handlePlaceHolderFontColorForIE,
            blur: handlePlaceHolderFontColorForIE
        })
    };

    //处理IE8,9placeholder字体颜色问题
    var handlePlaceHolderFontColorForIE = function () {
        if ($(this).val() != "" && $(this).val() != $(this).attr("placeholder")) {
            $(this).removeClass("placeholder");
        } else {
            $(this).addClass("placeholder");
        }
    }

    //处理siderbar高度
    var handleSidebarHeight = function () {
        var height = $(window).height() - $(".header:first").height() - $(".footer:last").outerHeight() + 3;
        var style = $(".page-sidebar").attr("style");
        var partten = /height:\s?\d*px\s!important;/g;
        if (partten.test(style)) {
            $(".page-sidebar").attr("style", style.replace(partten, "height:" + height + "px !important;"));
        } else {
            $(".page-sidebar").attr("style", "height:" + height + "px !important;" + style);
        }
    }

    //滚动siderbar
    var handleScrollSidebar = function () {
        var menu = $(".page-sidebar-menu");
        var height = $(window).height() - $(".header:first").height() - $(".footer:last").outerHeight() + 3;
        if (menu.parent('.slimScrollDiv').size() === 1) {
            menu.slimScroll({
                destroy: true
            });
            menu.removeAttr('style');
        }
        menu.slimScroll({
            size: '7px',
            color: '#a1b2bd',
            opacity: .4,
            position: 'right',
            height: height + "px",
            allowPageScroll: false,
            disableFadeOut: false
        });

    }

    //缩小操作th宽度
    var handleThWidth = function () {

    }

    return {
        //main function to initiate template pages
        init: function () {
            handleResponsive(); // set and handle responsive
            handleUniform(); // handles uniform elements
            // global handlers
            handleChoosenSelect(); // handles bootstrap chosen dropdowns
            handleScrollers(); // handles slim scrolling contents
            handleTagsInput(); // handles tag input elements
            handlePortletTools(); // handles portlet action bar functionality(refresh, configure, toggle, remove)
            handleTooltip(); // handles bootstrap tooltips
            handlePopover(); // handles bootstrap popovers
            handleToggleButtons(); // handles form toogle buttons
            handleWysihtml5(); //handles WYSIWYG Editor
            handleMainMenu(); // handles main menu
            handleSidebarToggler(); // handles sidebar hide/show
            handleFixInputPlaceholderForIE(); // fixes/enables html5 placeholder attribute for IE9, IE8
            handleGoTop(); //handles scroll to top functionality in the footer
            handleAccordions(); //handles accordions

            colseDIYWin();
            handleDatePicker();
            handleDateTimePicker();
            handleProLetRomColor();
            handleSyncFormValidate();

            handleScrollSidebar();
            handleSidebarHeight();
            $(window).resize(function () {
                handleSidebarHeight();
                handleScrollSidebar();
            });

            if (isIE8 || isIE9 || isIE10) {
                handleResetForm();
                handleBindEventPlaceHolderFontColorForIE();
            }

            if (isIE8) {
                responsiveWindowHeight();
                $(window).resize(function () {
                    responsiveWindowHeight();
                });
            }
        },

        // wrapper function to scroll to an element
        scrollTo: function (el, offeset) {
            pos = el ? el.offset().top : 0;
            jQuery('html,body').animate({
                scrollTop: pos + (offeset ? offeset : 0)
            }, 'slow');
        },

        // wrapper function to  block element(indicate loading)
        blockUI: function (el, loaderOnTop) {
            lastBlockedUI = el;
            jQuery(el).block({
                message: '<img src="./assets/img/loading.gif" align="absmiddle">',
                css: {
                    border: 'none',
                    padding: '2px',
                    backgroundColor: 'none'
                },
                overlayCSS: {
                    backgroundColor: '#000',
                    opacity: 0.05,
                    cursor: 'wait'
                }
            });
        },

        // wrapper function to  un-block element(finish loading)
        unblockUI: function (el) {
            jQuery(el).unblock({
                onUnblock: function () {
                    jQuery(el).removeAttr("style");
                }
            });
        },

        // public method to initialize uniform inputs
        initFancybox: function () {
            handleFancyBox();
        },

        // initializes uniform elements
        initUniform: function (el) {
            initUniform(el);
        },

        // initializes choosen dropdowns
        initChosenSelect: function (el) {
            initChosenSelect(el);
        },

        getActualVal: function (el) {
            var el = jQuery(el);
            if (el.val() === el.attr("placeholder")) {
                return "";
            }

            return el.val();
        },

        // check for device touch support
        isTouchDevice: function () {
            try {
                document.createEvent("TouchEvent");
                return true;
            } catch (e) {
                return false;
            }
        },

        //判断值是否为null,"",undefined
        isNundef: function (value) {
            return value !== null && value !== "" && typeof(value) != "undefined";
        },

        //判断值是否等于placeholder的值,
        isEqPlacehoder: function ($obj) {
            if (App.isNundef($obj.attr("placeholder")) && $obj.val() === $obj.attr("placeholder")) {
                return null;
            }
            return $obj.val();
        },

        //高亮菜单
        activeMenu: function (href) {
            var a = $("a[href*='" + href + "']");
            var li = a.parent();
            li.addClass("active");
            var parent = li.parent().parent();
            parent.addClass("active").addClass("open");
            parent.find("a .arrow").addClass("open");
        },

        //取消高亮
        cancleActiveMenu: function (href) {
            $("a[href*='" + href + "']").parent().removeClass("active");
        },

        //生成操作按钮{icon:"iconUser",name:"操作",group:[{clickFn:"edit(2)",icon:"icon-pencil",name:"修改"}]}
        initDropDownBtn: function (obj) {
            var div = $('<div class="btn-group mini"></div>');
            var a = $('<a class="btn green mini" href="#" data-toggle="dropdown"></a>')
                .append('<i class="' + obj.icon + '"></i> ')
                .append(obj.name)
                .append('<i class="icon-angle-down"></i>');
            var ul = $('<ul class="dropdown-menu"></ul>');
            $.each(obj.group, function (i, item) {
                ul.append('<li><a href="javascript:void(0)" onclick="javascript:' + item.clickFn + ';"><i class="' + item.icon + '"></i>' + item.name + '</a></li>');
            });
            return div.append(a).append(ul);
        },

        //判断一个值是否在数组中
        in_array: function (value, array) {
            for (var i in array) {
                if (array[i] == value) {
                    return true;
                }
            }
            return false;
        },

        //弹出框
        alert: function (str) {
            bootbox.alert(str);
        },

        //选择框
        confirm: function (callback) {
            bootbox.confirm("确定？", callback);
        },

        //文件下载
        downloadFile: function (fileName, fileUuid) {
            var url = encodeURI(ctx + "/file/download?fileName=" + fileName + "&fileUuid=" + fileUuid);
            window.location.href = encodeURI(url);
        },

        //初始化异步提交表单的验证
        initAsyncFormValidate: function (form, callback) {
            $(form).validate({
                submitHandler: function (form) {
                    $(form).ajaxSubmit(callback);
                }
            });
        },

        //设置数据列表th宽度
        setDataThWidth: function () {
            $("th:contains('操作')").css("width", "50px");
        },

        //菜单过滤
        doMenuFilter: function (obj) {
            if (!App.isNundef($(obj).val())) {
                $("li.menu,li.menu-child").show();
                $("li.menu").removeClass("open");
                $("li.menu-child.active").parent().closest("li").show();
                return;
            }
            $("li.menu").addClass("open");
            var value = $(obj).val();
            $("li.menu,li.menu-child").hide();
            $("li.menu-child:has(a:contains('" + value + "'))").show().parent().closest("li").show();
            $("li.menu:has(a span:contains('" + value + "'))").show().find("li").show();
        }
        //为了兼容IE8在window.location.href不把header[referer]带上的问题,做以下封装
//		gotoUrl
    };
}();
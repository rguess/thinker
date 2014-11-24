var Chat = {

    url: ctx + "/chat/servlet3",

    init: function () {
        Chat.longPolling();
        Chat.handleChat();
    },

    /**
     *连接到服务器
     * @param url
     * @param callback
     */
    longPolling: function () {
        $.ajax({
            url: Chat.url + "/poll",
            type: "POST",
            async: true,
            cache: false,
            global: false,
            timeout: 30 * 1000,
            success: function (data) {
                var obj = $.parseJSON(data);
                if (App.isNundef(data)) {
                    Chat.insertData(obj, "in");
                }
                setTimeout(
                    function () {
                        Chat.longPolling();
                    },
                    10
                );
            },
            error: function (data) {
                setTimeout(
                    function () {
                        Chat.longPolling();
                    },
                    10
                );
            }
        });
    },
    /**
     * 发送消息
     */
    send: function (msg) {
        $.ajax({
            url: Chat.url + "/send",
            type: "POST",
            data: {msg: msg}
        });
    },
    /**
     * insertData
     */
    insertData: function (data, inorout) {
        var cont = $('#chats');
        var list = $('.chats', cont);
        var form = $('.chat-form', cont);
        var input = $('input', form);
        var btn = $('.btn', form);


        var headerImgPath = (inorout == "in") ? "avatar1.jpg" : "avatar2.jpg";
        var time = new Date();
        var time_str = time.format("hh:mm:ss");
        var tpl = '';
        tpl += '<li class="' + inorout + '">';
        tpl += '<img class="avatar" alt="" src="' + ctx + '/assets/img/' + 'avatar.png' + '"/>';
        tpl += '<div class="message">';
        tpl += '<span class="arrow"></span>';
        tpl += '<a href="#" class="name">'+data.username+'</a>&nbsp;';
        tpl += '<span class="datetime">' + time_str + '</span>';
        tpl += '<span class="body">';
        tpl += '<b>' + data.msg + '</b>';
        tpl += '</span>';
        tpl += '</div>';
        tpl += '</li>';

        list.append(tpl);
        $('.scroller', cont).slimScroll({
            scrollTo: list.height()
        });
    },
    /**
     * 初始化对话窗口
     */
    handleChat: function () {
        var cont = $('#chats');
        var form = $('.chat-form', cont);
        var input = $('input', form);
        var btn = $('.btn', form);

        var handleClick = function () {
            var text = input.val();
            if (text.length == 0) {
                return;
            }

            Chat.send(text);
            Chat.insertData({msg: text,username:me}, "in");
            input.val("");
        }

        btn.click(handleClick);
        input.keypress(function (e) {
            if (e.which == 13) {
                handleClick();
                return false;
            }
        });
    }
}
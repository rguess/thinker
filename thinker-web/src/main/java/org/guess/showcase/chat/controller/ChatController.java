package org.guess.showcase.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by rguess on 2014/8/19.
 */

@Controller
@RequestMapping("/chat")
public class ChatController {

    private final static String indexView = "/chat/chat";

    @RequestMapping(method = RequestMethod.GET, value = "/servlet3")
    public ModelAndView index(){
        ModelAndView mav = new ModelAndView(indexView);
        return mav;
    }
}

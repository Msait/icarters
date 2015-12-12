package com.icarters.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Kostiantyn Bondar.
 */
@Controller
@RequestMapping(value = {"/", "home"})
public class HomeController {

    private static final Logger LOG = LoggerFactory.getLogger(HomeController.class.getSimpleName());

    @RequestMapping(method = RequestMethod.GET)
    public String showHomePage() {
        LOG.debug("Home Controller fire");
        return "home";
    }

    @RequestMapping("/login-error.html")
    public String loginError(Model model) {
        model.addAttribute("loginError", true);
        return "login.html";
    }

}

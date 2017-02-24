package main.java.controller;


import main.java.model.User;
import main.java.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Suntey on 16.02.2017.
 */
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "/")
    public String listUsers(@RequestParam(value = "j_userName", required = false)String name,Model model){
        if (name != null){
            System.out.println(name);
            List<User> resultOfSearch = this.userService.listUsers(name);
            model.addAttribute("listUsers", resultOfSearch);
        }
         else model.addAttribute("listUsers", this.userService.listUsers());

        return "hello";
    }
    @ModelAttribute("user")
    public User newUser(){
        return new User();
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user){
        if (user.getUserId() == 0){
            this.userService.createUser(user);}
        else {this.userService.updateUser(user);}
        return "redirect:/";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String deleteUser(@PathVariable("id")int id){
        userService.deleteUser(id);

        return "redirect:/";
    }
    @RequestMapping(value = "/edit/{id}")
    public String editUser(@PathVariable("id")int id, Model model){
        model.addAttribute("user", userService.getUserById(id));
        model.addAttribute("listUsers", this.userService.listUsers());
        return "hello";
    }



//    @RequestMapping(value = "/searchUser")
//    public String searchUser(@RequestParam("j_userName")String name, Model model){
//        List<User> resultOfSearch = this.userService.listUsers(name);
//        model.addAttribute("listUsers", resultOfSearch);
//        return "hello";
//    }
}

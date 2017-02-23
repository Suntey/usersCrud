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

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String listUsers(Model model){

         model.addAttribute("listUsers", this.userService.listUsers());

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



    @RequestMapping(value = "/searchUser")
    public String searchUser(@RequestParam("j_userName")String name, Model model){
        System.out.println(name);
        if (!name.isEmpty()){
            List<User> userList = new ArrayList<>();
            for (User user : userService.listUsers()) {
                if (user.getUserName().equals(name)){
                    userList.add(user);
                }
            }
            model.addAttribute("listUsers", userList);

        }
        return "hello";
    }
}

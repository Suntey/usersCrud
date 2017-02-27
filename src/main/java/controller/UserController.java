package main.java.controller;


import main.java.model.User;
import main.java.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

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

    @RequestMapping(value="/")
    public ModelAndView listOfUsers(@RequestParam(required = false) Integer page, User user) {
        ModelAndView modelAndView = new ModelAndView("hello");
        if (user != null){
            modelAndView.addObject("user", user);
        }
        List<User> users = userService.listUsers();
        PagedListHolder<User> pagedListHolder = new PagedListHolder<>(users);
        pagedListHolder.setPageSize(5);
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());

        if(page==null || page < 1 || page > pagedListHolder.getPageCount()){page=1;}

        pagedListHolder.setPage(page-1);
        modelAndView.addObject("listUsers", pagedListHolder.getPageList());
        modelAndView.addObject("page", page);
        return modelAndView;
    }

    @ModelAttribute("user")
    public User newUser(){
        return new User();
    }

    @RequestMapping(value = "{pageNumber}/addUser", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user, @PathVariable("pageNumber")Integer pageNumber){
        if (user.getUserId() == 0){
            this.userService.createUser(user);}
        else {this.userService.updateUser(user);}
        return "redirect:/?page="+pageNumber;
    }

    @RequestMapping(value = "/{pageNumber}/delete/{id}", method = RequestMethod.GET)
    public String deleteUser(@PathVariable("id")int id, @PathVariable("pageNumber")Integer pageNumber){
        System.out.println(pageNumber);
        userService.deleteUser(id);

        return "redirect:/?page="+pageNumber;
    }
    @RequestMapping(value = "/{pageNumber}/edit/{id}")
    public ModelAndView editUser(@PathVariable("id")int id, @PathVariable("pageNumber")Integer pageNumber, Model model){
        return listOfUsers(pageNumber,userService.getUserById(id));

    }

    @RequestMapping(value = "{pageNumber}/searchUser")
    public String searchUser(@RequestParam("j_userName")String name,  Model model, @PathVariable("pageNumber")Integer pageNumber){
        List<User> resultOfSearch = this.userService.listUsers(name);
        model.addAttribute("listUsers", resultOfSearch);
        model.addAttribute("indication", new Boolean(true));
        model.addAttribute("backPage", pageNumber);
        return "hello";
    }
}


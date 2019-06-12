package main.controllers;

import main.entity.Data;
import main.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    private JmsTemplate jmsTemplate;

    @GetMapping("/")
    public String mainPage() {
        return "home";
    }

    @GetMapping("/new-user")
    public String newUsers(ModelMap modelMap) {
        modelMap.addAttribute("user", new User());
        return "add-user";
    }

    @PostMapping("/new-user")
    public String newUser(User user) {
        String view = "home";
        List<User> userList = new ArrayList<>();
        userList.add(user);
        Data data = new Data("SAVE", userList);
        jmsTemplate.convertAndSend("server", data);
        data = (Data) jmsTemplate.receiveAndConvert("client");
        if (data.getOperation().equals("SAVED")) {
            view = "redirect:/all-users";
        }
        return view;
    }

    @GetMapping("/all-users")
    public String getAllUsers(ModelMap modelMap) {
        String view = "home";
        List<User> userList = new ArrayList<>();
        Data data = new Data("SHOW_ALL", userList);
        jmsTemplate.convertAndSend("server", data);
        data = (Data) jmsTemplate.receiveAndConvert("client");
        if (data.getOperation().equals("RETURNED")) {
            modelMap.addAttribute("users", data.getUserList());
            view = "all-users";
        }
        return view;
    }

    @GetMapping("/delete/{id}")
    public String deleteUserById(@PathVariable Long id) {
        String view = "home";
        List<User> userList = new ArrayList<>();
        userList.add(new User(id));
        Data data = new Data("DELETE", userList);
        jmsTemplate.convertAndSend("server", data);
        data = (Data) jmsTemplate.receiveAndConvert("client");
        if (data.getOperation().equals("DELETED")) {
            view = "redirect:/all-users";
        }
        return view;
    }
}





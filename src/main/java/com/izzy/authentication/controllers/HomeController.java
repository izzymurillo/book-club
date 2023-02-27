package com.izzy.authentication.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.izzy.authentication.models.LoginUser;
import com.izzy.authentication.models.User;
import com.izzy.authentication.services.UserService;

// .. don't forget to inlcude all your imports! ..

@Controller
public class HomeController {

  // Add once service is implemented:
  @Autowired
  private UserService userServ;

  // ====== (RENDERS BOTH LOGIN & REGISTRATION FORMS) ======
  @GetMapping("/")
  public String index(Model model) {
    // Bind empty User and LoginUser objects to the JSP
    // to capture the form input
    model.addAttribute("newUser", new User());
    model.addAttribute("newLogin", new LoginUser());
    return "index.jsp";
  }

  // ========= (POST ROUTE FOR REGISTRATION) ==========
  @PostMapping("/register")
  public String register(
    @Valid @ModelAttribute("newUser") User newUser,
    BindingResult result,
    Model model,
    HttpSession session) {

      User user = userServ.register(newUser, result);
      // TO-DO Later -- call a register method in the service
      // to do some extra validations and create a new user!
      
      if (result.hasErrors()) {
        // Be sure to send in the empty LoginUser before
        // re-rendering the page.
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
      }
      
      // No errors!
      // TO-DO Later: Store their ID from the DB in session,
      session.setAttribute("userId", user.getId());
      session.setAttribute("userName", user.getUserName());
      // in other words, log them in.
      return "redirect:/welcome";
    }
    
  // ============ (POST ROUTE FOR LOGIN) =============
  @PostMapping("/login")
  public String login(
    @Valid @ModelAttribute("newLogin") LoginUser newLogin,
    BindingResult result,
    Model model,
    HttpSession session) {
      
      // Add once service is implemented:
      User user = userServ.login(newLogin, result);
      
      if (result.hasErrors()) {
        model.addAttribute("newUser", new User());
        return "index.jsp";
      }
      // No errors!
      // TO-DO Later: Store their ID from the DB in session,
      session.setAttribute("userId", user.getId());
      session.setAttribute("userName", user.getUserName());
      // in other words, log them in.
      return "redirect:/welcome";
    }
    
  // ============ (Welcome - Dashboard) =============
  @GetMapping("/welcome")
  public String welcome() {
    return "welcome.jsp";
  }
  
  // ============ (Logout) =============
  @GetMapping("/logout")
  public String logout(HttpSession session) {
    // clear session to logout
    // session.setAttribute("userId", null);
    // session.invalidate();
    return "redirect:/";
  }


}

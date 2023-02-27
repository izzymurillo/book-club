package com.izzy.authentication.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.izzy.authentication.models.LoginUser;
import com.izzy.authentication.models.User;
import com.izzy.authentication.repositories.UserRepository;

@Service
public class UserService {

  @Autowired
  private UserRepository userRepo;

  // TO-DO: Write register and login methods!

  // ================== REGISTER ====================
  // This method will be called from the controller
  // whenever a user submits a registration form.
  public User register(User newUser, BindingResult result) {

    // TO-DO: Additional validations!
    Optional<User> user = userRepo.findByEmail(newUser.getEmail());
    // -----------------------------------------------
    // TO-DO - Reject values or register if no errors:
    // -----------------------------------------------
    // --(Reject Values)------------------------------
    // Reject if email is taken (present in database)
    if (user.isPresent()) {
      result.rejectValue("email", "Email", "Email already registered");
    }
    // Reject if password doesn't match confirmation
    if (!newUser.getPassword().equals(newUser.getConfirm())) {
      result.rejectValue("confirm", "Confirm", "Passwords must match");
    }
    // Return null if result has errors
    if (result.hasErrors()) {
      return null;
    }
    // ---(Register)----------------------------------
    // (at this point everything checks out & we can register the user)
    // Hash and set password, save user to database
    String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
    newUser.setPassword(hashed); // <-override the pw with a hash
    return userRepo.save(newUser);
    // -----------------------------------------------
  }
  
  // ==================== LOGIN ======================
  // This method will be called from the controller
  // whenever a user submits a login form.
  public User login(LoginUser newLoginObject, BindingResult result) {
    // TO-DO: Additional validations!
    // -----------------------------------------------
    // TO-DO - Reject values: (for EMAIL & PASSWORD)
    // -----------------------------------------------
    // Find user in the DB by email (helper function created below)
    if(!this.checkEmail(newLoginObject.getEmail())){
      // --(Reject Values - check the EMAIL)--------------------
      // Reject if NOT present
      result.rejectValue("email", "noEmail", "Invalid Login");
    }
    // Return null if result has errors
    if(result.hasErrors()){
      return null;
    }
    // -----------------------------------------------
    // (at this point we found the email)
    // -----------------------------------------------
    // (now we just need to check the password)
    // -----------------------------------------------
    User user = userRepo.findByEmail(newLoginObject.getEmail()).orElse(null);
    // --(Reject Values - check the PASSWORD)-----------------
    // Reject if BCrypt password match fails
    if(!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())){
      result.rejectValue("password", "Password","Invalid Login"
      );
    }
    // Return null if result has errors
    if(result.hasErrors()){
      return null;
    }
    // ----------------------------------------------------
    // ( at this point we confirmed both EMAIL & PASSWORD )
    // ----------------------------------------------------
    // ---(so OK to proceed to Login)----------------------
    // Otherwise, return the user object
    return user;
  }
  
  // Helper Function to check if email is in DB (used for login)
  public boolean checkEmail(String email){
    Optional<User> user = userRepo.findByEmail(email);
    if(user.isPresent()){
      return true;
    } else {
      return false;
    }
  }

}

package com.izzy.authentication.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.izzy.authentication.models.Book;
import com.izzy.authentication.services.BookService;

@Controller
public class BookController {

  @Autowired
  BookService bookService;

  // ========= ( READ ALL ) ==========
  @GetMapping("/books")
  public String allBooks(Model model, HttpSession session) {
    // If user is not logged in, redirect to logout
    if (session.getAttribute("userId") == null) {
      return "redirect:/logout";
    }
    // List<Book> books = bookService.getAll();
    // model.addAttribute("books", books); //(same as below)
    model.addAttribute("books", bookService.getAll());
    return "books/index.jsp";
  }

  // ========== ( CREATE ) ===========
  // ------------ Render -------------
  @GetMapping("books/new")
  public String newBook(@ModelAttribute("book") Book book, HttpSession session) {
    // If user is not logged in, redirect to logout
    if (session.getAttribute("userId") == null) {
      return "redirect:/logout";
    }
    return "books/new.jsp";
  }

  // ------------- Post -------------- 
  @PostMapping("/books")
  public String createBook(@Valid @ModelAttribute("book") Book book, BindingResult results, HttpSession session) {
    // If user is not logged in, redirect to logout
    if (session.getAttribute("userId") == null) {
      return "redirect:/logout";
    } else if (results.hasErrors()) {
      return "books/new.jsp";
    } else {
    bookService.addBook(book);
    return "redirect:/books";
    }
  }

  // ========= ( READ ONE ) ==========
  @GetMapping("books/{id}")
  public String show(@PathVariable("id") Long id, Model model, HttpSession session) {
    // If user is not logged in, redirect to logout
    if (session.getAttribute("userId") == null) {
      return "redirect:/logout";
    }
    Book book = bookService.getOne(id);
    model.addAttribute("book", book);
    return "books/show.jsp";
  }

  // ========== ( UPDATE ) ===========
  // ------------ Render -------------
  @GetMapping("/books/edit/{id}")
  public String edit(@PathVariable("id") Long id, Model model, HttpSession session) {
    // If user is not logged in, redirect to logout
    if (session.getAttribute("userId") == null) {
      return "redirect:/logout";
    }
    Book book = bookService.getOne(id);
    model.addAttribute("book", book);
    return "books/edit.jsp";
  }

  // ------------- Post --------------
  @PostMapping("/books/{id}") // <---?????? @PutMapping ???? see edit.jsp method
  public String update(@Valid @ModelAttribute("book") Book book, BindingResult results, HttpSession session) {
    // If user is not logged in, redirect to logout
    if (session.getAttribute("userId") == null) {
      return "redirect:/logout";
    } else if (results.hasErrors()) {
      return "books/edit.jsp";
    } else {
    bookService.updateBook(book);
    return "redirect:/books";
    }
  }

  // ========== ( DELETE ) ===========
  @DeleteMapping("/books/{id}") // <--?????? same route as update post & read one???
  public String destroy(@PathVariable("id") Long id, HttpSession session) {
    // If user is not logged in, redirect to logout
    if (session.getAttribute("userId") == null) {
      return "redirect:/logout";
    }
    bookService.deleteBook(id);
    return "redirect:/books";
  }

}

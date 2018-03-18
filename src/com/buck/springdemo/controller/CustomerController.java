package com.buck.springdemo.controller;

import com.buck.springdemo.dao.CustomerDAO;
import com.buck.springdemo.entity.Customer;
import com.buck.springdemo.services.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/customer")
public class CustomerController {
    //need to inject the customer dao
    @Autowired
    private CustomerService customerService;
    @GetMapping("/list")
    public String listCustomer(Model model){
        //get customers from the DAO
        List<Customer> theCustomers=customerService.getCustomers();
        //add those customers to the model
        model.addAttribute("customers",theCustomers);

        return "list-customers";
    }
    @GetMapping("/showFormForAdd")
    public String addCustomer(Model model){
        //create model attribute to bind form data
        Customer customer=new Customer();

        model.addAttribute("customer", customer);
        return "customer-form";
    }
}

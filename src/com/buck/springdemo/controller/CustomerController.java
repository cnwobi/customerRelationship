package com.buck.springdemo.controller;

import com.buck.springdemo.dao.CustomerDAO;
import com.buck.springdemo.entity.Customer;
import com.buck.springdemo.services.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
    @PostMapping("/saveCustomer")
    public String saveCustomer(@ModelAttribute("customer") Customer customer){
        //save customer
        customerService.saveCustomer(customer);
        return "redirect:/customer/list";
    }
    @GetMapping("/showFormForUpdate")
    public String showFormForUpdate(@RequestParam("customerId") int theId, Model model){
        //get the customer from DB
        Customer customer= customerService.getCustomer(theId);
        //set customer as a model attribute
        model.addAttribute("customer",customer);
        //send over to form

        return"customer-form";

    }
    @GetMapping("/delete")
    public String deleteCustomer(@RequestParam("customerId") int Id){
        //delete customer
        customerService.deleteCustomer(Id);
        return "redirect:/customer/list";
    }
    @PostMapping("/search")
    public String searchCustomers(@RequestParam("theSearchName") String theSearchName,
                                  Model theModel) {

        // search customers from the service
        List<Customer> theCustomers = customerService.searchCustomers(theSearchName);

        // add the customers to the model
        theModel.addAttribute("customers", theCustomers);

        return "list-customers";
    }
}

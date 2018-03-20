package com.buck.springdemo.services;

import com.buck.springdemo.entity.Customer;

import java.util.List;

public interface CustomerService {
    public List<Customer> getCustomers();

    public void saveCustomer(Customer customer);

    public Customer getCustomer(int Id);

    public void deleteCustomer(int id);
    public List<Customer> searchCustomers(String theSearchName);
}
package com.buck.springdemo.dao;

import com.buck.springdemo.entity.Customer;

import java.util.List;

public interface CustomerDAO {
    public List<Customer> getCustomers();
    public void saveCustomer(Customer customer);
    public Customer getCustomer(int ID);
    public void deleteCustomer(int Id);
    public List<Customer> searchCustomers(String theSearchName);
}

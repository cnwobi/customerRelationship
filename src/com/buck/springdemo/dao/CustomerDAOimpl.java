package com.buck.springdemo.dao;

import com.buck.springdemo.entity.Customer;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Queue;
@Repository
public class CustomerDAOimpl implements CustomerDAO {
    // inject session factory
    @Autowired
    private SessionFactory sessionFactory;
    @Override

    public List<Customer> getCustomers() {
        //get current session
        Session currentSession=sessionFactory.getCurrentSession();
        //create querry
        Query<Customer> theQuery=currentSession.createQuery("from Customer ",Customer.class);
        //excute and return customers
        List<Customer> customers=theQuery.getResultList();
        return customers;
    }
}

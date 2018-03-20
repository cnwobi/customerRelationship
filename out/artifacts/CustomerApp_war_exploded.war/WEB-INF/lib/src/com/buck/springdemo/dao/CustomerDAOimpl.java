package com.buck.springdemo.dao;

import com.buck.springdemo.entity.Customer;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import java.util.List;

@Repository
public class CustomerDAOimpl implements CustomerDAO {
    // inject session factory
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Customer getCustomer(int ID) {
        //get current Session
        Session session= sessionFactory.getCurrentSession();
        //retrieve object using primary key
        Customer customer=session.get(Customer.class,ID);
        return customer;
    }

    @Override
    public void deleteCustomer(int theId) {
        //get current session
        Session session=sessionFactory.getCurrentSession();
        //delete object with primary key
        Query theQuery= session.createQuery("delete from Customer where id=:customerId");
        theQuery.setParameter("customerId",theId);
        theQuery.executeUpdate();
    }

    @Override
    public void saveCustomer(Customer customer) {
//get current session
        Session session= sessionFactory.getCurrentSession();
        //save or update customer
        session.saveOrUpdate(customer);
    }

    @Override

    public List<Customer> getCustomers() {
        //get current session
        Session currentSession=sessionFactory.getCurrentSession();
        //create querry
        Query<Customer> theQuery=currentSession.createQuery("from Customer order by firstName",Customer.class);
        //excute and return customers
        List<Customer> customers=theQuery.getResultList();
        return customers;
    }

    @Override
    public List<Customer> searchCustomers(String theSearchName) {
        //get current session
        Session session= sessionFactory.getCurrentSession();
        Query theQuery =null;

        //
        // only search by name if theSearchName is not empty
        //
        if (theSearchName != null && theSearchName.trim().length() > 0) {

            // search for firstName or lastName ... case insensitive
            theQuery =session.createQuery("from Customer where lower(firstName) like :theName or lower(lastName) like :theName", Customer.class);
            theQuery.setParameter("theName", "%" + theSearchName.toLowerCase() + "%");

        }
        else {
            // theSearchName is empty ... so just get all customers
            theQuery =session.createQuery("from Customer", Customer.class);
        }

        // execute query and get result list
        List<Customer> customers = theQuery.getResultList();

        // return the results
        return customers;

    }

}

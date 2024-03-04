package com.ems.edusystem.JpaConectivity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class CustomerServiceImp implements CustomerService{
	private CustomerRepository customerRepo;

	public CustomerServiceImp(CustomerRepository customerRepo){
		this.customerRepo = customerRepo;
	}

	@Override
	public 	CustomerPojo saveCustomer(CustomerPojo custpojo){
		return customerRepo.save(custpojo);
	}

	@Override
	public CustomerPojo updateCustomer(CustomerPojo custpojo, long id){
		custpojo.setId(id);
		customerRepo.save(custpojo);
		return custpojo;
	}

	@Override
	public void deleteCustomer(long id){
		customerRepo.deleteById(id);
	}

	@Override
	public List<CustomerPojo> getCustomer(){
		return customerRepo.findAll();
	}
}
package com.ems.edusystem.JpaConectivity;

import java.util.List;

public interface CustomerService{
	CustomerPojo saveCustomer(CustomerPojo custpojo);
	CustomerPojo updateCustomer(CustomerPojo custpojo, long id);
	void deleteCustomer(long id);
	List<CustomerPojo> getCustomer();
}
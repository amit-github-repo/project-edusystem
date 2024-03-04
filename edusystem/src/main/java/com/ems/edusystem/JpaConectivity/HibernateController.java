package com.ems.edusystem.JpaConectivity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.List;

@RestController
public class HibernateController{
	private CustomerService customerService;

	@Autowired
	public HibernateController(CustomerService customerService){
		this.customerService = customerService;
	}

	@PostMapping("/api/customer")
	public ResponseEntity<CustomerPojo> saveCustomerDetails(@RequestBody CustomerPojo custpojo){
		return new ResponseEntity<CustomerPojo>(customerService.saveCustomer(custpojo), HttpStatus.CREATED);
	}

	@PutMapping("/api/{id}")
	public ResponseEntity<String> updateCustomerDetails(@RequestBody CustomerPojo custpojo, @PathVariable("id") long id){
		customerService.updateCustomer(custpojo, id);
		return new ResponseEntity<String> ("Update Successfully..", HttpStatus.NOT_FOUND);
	}

	@DeleteMapping("/api/{id}")
	public ResponseEntity<String> deleteCustomerDetails(@PathVariable("id") long id){
		customerService.deleteCustomer(id);
		return new ResponseEntity<String> ("Customer having ("+id+") id no. is deleted..", HttpStatus.NOT_FOUND);
	}

	@GetMapping("/api/get")
	public List<CustomerPojo> getCustomer(){
		return customerService.getCustomer();
	}
}
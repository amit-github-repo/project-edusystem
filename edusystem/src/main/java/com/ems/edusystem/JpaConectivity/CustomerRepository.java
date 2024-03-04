package com.ems.edusystem.JpaConectivity;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerRepository extends JpaRepository<CustomerPojo,Long>{
	
}
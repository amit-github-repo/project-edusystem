package com.ems.edusystem.JpaConectivity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "Customer")
@Data
public class CustomerPojo {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	@Column(name = "first_name", nullable = false)
	private String firstname;
	@Column(name = "last_name")
	private String lastname;
	@Column(name = "e_mail")
	private String email;
	
}
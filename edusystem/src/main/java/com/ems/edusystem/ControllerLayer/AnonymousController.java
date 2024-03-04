package com.ems.edusystem.ControllerLayer;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;

import jakarta.servlet.http.HttpSession;

import java.util.*;
import java.sql.*;

import model.ProductData;
import org.springframework.web.bind.annotation.ResponseBody;


@SpringBootApplication
@Controller
public class AnonymousController {

	@GetMapping("/index")
	public String index(){
		return "index";
	}
	@GetMapping("/login")
	public String login(){
		return "login";
	}
	@GetMapping("/register")
	public String register(){
		return "register";
	}
	@GetMapping("/updateProfile")
	public String updateProfile(){
		return "updateProfile";
	}
	@GetMapping("/logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "index";
	}

	@Autowired
	JdbcTemplate jdbc;
	@PostMapping("/login")
	public String login_check(	@RequestParam("email") String email,
								@RequestParam("password") String password,
								Model model,
								HttpSession session){
		ArrayList<String> userdata = new ArrayList<>(5);
		List<String> li=jdbc.query("select * from user_master where email='"+email+"' and password='"+password+"'",
										new RowMapper<String>(){
											public String mapRow(ResultSet rs , int rowNum) throws SQLException {
												userdata.add(rs.getString(1));
												userdata.add(rs.getString(2));
												userdata.add(rs.getString(3));
												userdata.add(rs.getString(4));
												userdata.add(rs.getString(5));
												return rs.getString(1);
											}
										}
									);

		if (li.isEmpty()){
			model.addAttribute("sms","Invalid User.");
			return "login";
		}else{
			String status = userdata.get(4);
			String role = userdata.get(3);
			if("Active".equals(status)){
				session.setAttribute("name",li.get(0));
				session.setAttribute("email",userdata.get(1));

				if("student".equals(role)){
					return "studentDashboard";
				}else if("faculty".equals(role)){
					return "facultyDashboard";
				}else if("admin".equals(role)){
					return "adminDashboard";
				}
			}
			return "login";
		}
	}

	@PostMapping("/register")
	public String registerUserData( @RequestParam("name") String name,
									@RequestParam("email") String email,
									@RequestParam("password") String password,
									@RequestParam("role") String role,
									Model model){
		jdbc.execute("insert into user_master(name,email,password,role) values ('"+name+"','"+email+"','"+password+"','"+role+"')");
		jdbc.execute("insert into profile(email) values ('"+email+"')");
		model.addAttribute("sms","Register Success.");
		return "register";
	}

	@PostMapping("/updateProfile")
	public String updateProfile(@RequestParam("email") String email,
								@RequestParam("name") String name,
								@RequestParam("password") String password,
								@RequestParam("page") String page,
								Model model){
		//System.out.println(name+" "+email+" "+password+" "+page);
		String sql="Update user_master set password=?,name=? where email=? ";
		jdbc.update(sql,password,name,email);
		return page;	
	}

	// Code for Product Page Assessment 1
	
	@GetMapping("/product")
	public String product(){
		return "product";
	}

	@ResponseBody
	@PostMapping("/GetProduct")
	public ProductData GetProduct(@RequestParam("prodname") String prodname,Model model){
		//System.out.println(prodname);
		String sql="select * from Product_Master where ProductName=?";
		List<Map<String,Object>> prodmaster = jdbc.queryForList(sql,prodname);

		//System.out.println(prodmaster.get(0).get("ProductID"));
		//String data="{\"prodid\":"+prodmaster.get(0).get("ProductID")+",\"prodrate\":"+prodmaster.get(0).get("ProductRate")+",\"prodqty\":"+prodmaster.get(0).get("ProductQty")+"}";
		
		ProductData obj = new ProductData();
		obj.setProdId(prodmaster.get(0).get("ProductID")+"");
		//System.out.println(obj.getProdId());
		obj.setProdRate(prodmaster.get(0).get("ProductRate")+"");
		obj.setProdQty(prodmaster.get(0).get("ProductQty")+"");

		return obj;
	}

	@PostMapping("/PutData")
	public String PutData(@RequestParam("prodid") String prodid,
						@RequestParam("prodrate") int prodrate,
						@RequestParam("prodqty") int prodqty,
						Model model){
		int prodvalue = prodqty*prodrate;
		System.out.println(prodid+" "+prodrate+" "+prodqty+" "+prodvalue);

		return "product";
	}

}
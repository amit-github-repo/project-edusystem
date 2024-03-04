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

import java.util.*;

@SpringBootApplication
@Controller
public class AdminController {

	@GetMapping("/adminDashboard")
	public String adminDashboard(){
		return "adminDashboard";
	}

	@Autowired
	JdbcTemplate jdbc;
	@GetMapping("/users")
	public String users(Model model){
		//System.out.println("userPage call..");
		String sql = "select * from user_master where role != 'admin'";
		List<Map<String,Object>> usermaster = jdbc.queryForList(sql);
		model.addAttribute("usermaster",usermaster);
		return "adminlayout/users";
	}

	/*	@PostMapping("/manageusers")
		public String manageusers(  @RequestParam("email") String email,
									@RequestParam("btn") String btn,
									Model model){
			if (btn.equalsIgnoreCase("Delete")){
				String sql = "delete from user_master where email=?";
				jdbc.update(sql,email);
				return users(model);
			}else{
				String sql = "select * from user_master where email=?";
				List<Map<String,Object>> usermaster = jdbc.queryForList(sql,email);
				model.addAttribute("usermaster",usermaster);
				return "adminlayout/editUsers";
			}
		}	*/

	@PostMapping("/update_user")
	public String update_user(  @RequestParam("email") String email,
								@RequestParam("name") String name,
								@RequestParam("role") String role,
								@RequestParam("status") String status,
								Model model){
		String sql = "update user_master set name=? , role=? , status=? where email=?";
		jdbc.update(sql,name,role,status,email);
		return users(model);
	}

	@PostMapping("/delete_user")
	public String delete_user(  @RequestParam("email") String email, Model model){
		String sql = "delete from user_master where email=?";
		jdbc.update(sql,email);
		String sql1 = "delete from profile where email=?";
		jdbc.update(sql1,email);
		return users(model);
	}
}
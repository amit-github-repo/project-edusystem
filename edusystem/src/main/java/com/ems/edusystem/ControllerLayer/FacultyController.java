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

import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;
import java.sql.*;


@SpringBootApplication
@Controller
public class FacultyController {

	@GetMapping("/facultyDashboard")
	public String facultyDashboard(){
		return "facultyDashboard";
	}

	@GetMapping("/addQuestion")
	public String addQuestion(){
		return "facultylayout/addQuestion";
	}

	@GetMapping("/clearDoubt")
	public String clearDoubt(Model model){
		String sql="SELECT * FROM doubt_question";
		List<Map<String,Object>> doubt_data = jdbc.queryForList(sql);
		model.addAttribute("doubt_data",doubt_data);
		return "facultylayout/clearDoubt";
	}

	@Autowired
	JdbcTemplate jdbc;
	@PostMapping("/addQuestion")
	public String addQuestion( @RequestParam("qn") String qn,
									@RequestParam("op1") String op1,
									@RequestParam("op2") String op2,
									@RequestParam("op3") String op3,
									@RequestParam("op4") String op4,
									@RequestParam("ans") String ans,
									Model model){
		String sql="Insert into add_question(question,option1,option2,option3,option4,answer) values (?,?,?,?,?,?)";
		jdbc.update(sql,qn,op1,op2,op3,op4,ans);
		model.addAttribute("sms","Add Success.");
		return "facultylayout/addQuestion";
	}

	@GetMapping("/manageQn")
	public String users(Model model){
		//System.out.println("userPage call..");
		String sql = "select * from add_question";
		List<Map<String,Object>> addquestion = jdbc.queryForList(sql);
		model.addAttribute("addquestion",addquestion);
		return "facultylayout/manageQuestion";
	}

	@PostMapping("/update_qn")
	public String update_qn(    @RequestParam("sl_no") int sl_no,
								@RequestParam("question") String question,
								@RequestParam("option1") String option1,
								@RequestParam("option2") String option2,
								@RequestParam("option3") String option3,
								@RequestParam("option4") String option4,
								@RequestParam("answer") String answer,
								Model model){
		String sql = "update add_question set question=? , option1=? , option2=? , option3=? , option4=? , answer=? where sl_no=?";
		jdbc.update(sql,question,option1,option2,option3,option4,answer,sl_no);
		return users(model);
	}

	@PostMapping("/delete_qn")
	public String delete_qn(  @RequestParam("sl_no") String sl_no, Model model){
		System.out.println(sl_no);
		String sql = "delete from add_question where sl_no=?";
		jdbc.update(sql,sl_no);
		return users(model);
	}

	@PostMapping("/update_answer")
	@ResponseBody
	public String update_answer(@RequestParam("faculty_id") String faculty_id,
								@RequestParam("doubt_answer") String doubt_answer,
								@RequestParam("sl_no") String sl_no){
		//System.out.println(sl_no);System.out.println(faculty_id);System.out.println(doubt_answer);
		//String sql = "update doubt_question set faculty_id=? , doubt_answer=? , answer_date=now() where sl_no=?";
		//jdbc.update(sql,faculty_id,doubt_answer,sl_no);
		return "Success";		
	}
}

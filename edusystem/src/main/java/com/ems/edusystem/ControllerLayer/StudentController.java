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

import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;

import org.springframework.web.bind.annotation.ModelAttribute;
import model.ExamData;

import org.springframework.web.bind.annotation.ResponseBody;
import model.JsonString;

import java.io.InputStream;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;


import java.util.*;
import java.sql.*;

@SpringBootApplication
@Controller
public class StudentController {

	public String upload_dir="C:\\Users\\Arjun\\Desktop\\myproject\\edusystem\\src\\main\\resources\\static\\videos";

	@GetMapping("/studentDashboard")
	public String studentDashboard(){
		return "studentDashboard";
	}

	@Autowired
	JdbcTemplate jdbc;
	@GetMapping("/studentDoubt")
	public String studentDoubt(Model model){
		String sql="SELECT * FROM doubt_question";
		List<Map<String,Object>> doubt_data = jdbc.queryForList(sql);
		model.addAttribute("doubt_data",doubt_data);
		return "studentlayout/studentDoubt";
	}

	@GetMapping("/teacherUpload")
	public String teacherUpload(Model model){
		String sql="SELECT * FROM video_master";
		List<Map<String,Object>> video_data = jdbc.queryForList(sql);
		model.addAttribute("video_data",video_data);
		return "studentlayout/teacherUpload";
	}

	@GetMapping("/studentExam")
	public String studentExam(Model model){
		String sql="SELECT sl_no,question,option1,option2,option3,option4 FROM add_question ";
		List<Map<String,Object>> all_question = jdbc.queryForList(sql);
		model.addAttribute("all_question",all_question);
		return "studentlayout/studentExam";
	}

	@GetMapping("/examPage")
	public String examPage(HttpSession session, Model model){
		String email = (String)session.getAttribute("email");
		String sql="SELECT sl_no,exam_date,mark FROM add_answer where id = ? ";
		List<Map<String,Object>> user_exam_data = jdbc.queryForList(sql,email);
		model.addAttribute("user_exam_data",user_exam_data);
		return "studentlayout/examPage";
	}

	@GetMapping("/examPrevious")
	public String examPrevious( @RequestParam("edate") String edate,
								@RequestParam("eid") String eid, HttpSession session, Model model){
		//System.out.println("call.."+edate);
		String email = (String)session.getAttribute("email");
		int examid = Integer.parseInt(eid);
		String sql="SELECT student_answer FROM add_answer WHERE id = ? and exam_date = ? and sl_no = ?";
		List<Map<String,Object>> stu_ans = jdbc.queryForList(sql,email,edate,examid);

		String sql1="SELECT * FROM add_question LIMIT 3";
		List<Map<String,Object>> all_question = jdbc.queryForList(sql1);
		model.addAttribute("all_question",all_question);
		model.addAttribute("stu_ans",stu_ans.get(0).get("student_answer"));
		return "studentlayout/examPrevious";
	}

	@GetMapping("/profile")
	public String profile(HttpSession session , Model model){
		String email = (String)session.getAttribute("email");
		//System.out.println(email);
		String sql="SELECT name,user_master.email,role,photo,age FROM user_master LEFT JOIN profile ON user_master.email=profile.email WHERE user_master.email='"+email+"'";
		List<Map<String,Object>> userprofile = jdbc.queryForList(sql);
		model.addAttribute("userprofile",userprofile);
		model.addAttribute("photo",userprofile.get(0).get("photo"));
		return "studentlayout/profile";
	}

	@PostMapping("/upload_photo")
	public String upload_photo(	HttpSession session,
								Model model,
								@RequestParam("pic") MultipartFile pic) throws IOException{
		String email = (String)session.getAttribute("email");
		//System.out.println(email); System.out.println(pic);
		
		//This is for Video upload
		//System.out.println(pic.getInputStream()); System.out.println(pic.getOriginalFilename());
		//Files.copy(pic.getInputStream(),Paths.get(upload_dir+File.separator+pic.getOriginalFilename()),StandardCopyOption.REPLACE_EXISTING);

		String sql = "Update profile set photo=? where email=? ";
		jdbc.update(sql,pic.getBytes(),email);
		return "redirect:/profile";
	}

	@PostMapping("/update_profile")
	public String update_profile(@RequestParam("email") String email,
								@RequestParam("name") String name,
								@RequestParam("role") String role,
								Model model){
		//System.out.println(email); System.out.println(name);
		String sql = "Update user_master set name=? where email=? ";
		jdbc.update(sql,name,email);
		return "redirect:/profile";
	}

	@PostMapping("/add_doubt")
	public String add_doubt(@RequestParam("email") String email,
							@RequestParam("doubt") String doubt){
		//System.out.println(email); System.out.println(doubt);
		String sql = "INSERT INTO doubt_question (student_id,doubt) values (?,?)";
		jdbc.update(sql,email,doubt);
		return "redirect:/studentDoubt";
	}

	@PostMapping("/saveStudentAnswer")
	public String saveStudentAnswer(@ModelAttribute ExamData ed, HttpSession session){
		//	System.out.println(ed.getq1()+" "+ed.toString());

		String sql1="SELECT sl_no,answer FROM add_question";
		List<Map<String, Object>> stu_answer = jdbc.queryForList(sql1);
		String[] stu_ansArray = ed.getAnsArray();
		int total_mark = 0;
		for (Map<String, Object> rowMap : stu_answer){
			int sl_no = (int) rowMap.get("sl_no");
			int ans = (int) rowMap.get("answer");
			int stu_mark = Integer.parseInt(stu_ansArray[sl_no]); 
			if(ans == stu_mark){
				total_mark++;
			}
		}

		//	System.out.println(json_txt+" "+total_mark);
		String email = (String)session.getAttribute("email");
		String json_txt = ed.toString();

		String sql2 = "INSERT INTO add_answer (id,student_answer,mark) values (?,?,?)";
		jdbc.update(sql2,email,json_txt,total_mark);
		return "redirect:/studentResult";
	}

	@ResponseBody
	@PostMapping("/updateLike")
	public JsonString updateLike(	@RequestParam("current_like") int current_like,
									@RequestParam("like_status") String like_status,
									@RequestParam("video_name") String video_name){
		//int likes = Integer.parseInt(current_like);
		//System.out.println(current_like+" "+like_status+" "+video_name+" "+likes);
		if("false".equals(like_status)){
			//like up
			String sql = "Update video_master set likes=? where video_name=? ";
			jdbc.update(sql,++current_like,video_name);
		}else{
			//like down
			String sql1 = "Update video_master set likes=? where video_name=? ";
			jdbc.update(sql1,--current_like,video_name);
		}
		JsonString obj = new JsonString();
		obj.setmsg("Success");
		return obj;
	}
}


/*	Other method to travel on queryForList()
	stu_answer.forEach(rowMap -> { 
		int ans = (int) rowMap.get("answer");	
	});

	@PathVariable("edate") String edate
*/
package id.my.dxh30.userman.controller;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import id.my.dxh30.userman.dto.User;
import id.my.dxh30.userman.repository.UserRepository;

@Controller
@RequestMapping(path="/demo")
public class MainController {
	@Autowired
	private UserRepository userRepository;
	
	@PostMapping(path="/addUser")
	public @ResponseBody String addNewUser (@RequestParam String name, @RequestParam String email) {
		User n = new User();
		n.setName(name);
		n.setEmail(email);
		userRepository.save(n);
		return "Saved";
	}
	
	@GetMapping(path="/allUser")
	public @ResponseBody Iterable<User> getAllUsers() {
		return userRepository.findAll();
	}
	
}

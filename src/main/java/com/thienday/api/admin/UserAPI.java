package com.thienday.api.admin;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.thienday.dto.UserDTO;
import com.thienday.service.IUserService;

@RestController(value = "UserAPIOfAdmin" )
public class UserAPI {
	@Autowired
	private IUserService userService;
	
	private boolean isUserExisted = false;
	
	@GetMapping("/api/user")
	public UserDTO getUser(@RequestBody UserDTO userDTO) {
		return userDTO;
	}
	
	@PostMapping("/api/user")
	public UserDTO createUser(@RequestBody UserDTO userDTO) {
		
		isUserExisted = userService.isUserExist(userDTO.getUserName());
		if(isUserExisted == true)
		{
			System.out.println("User was exist");
		}
		else {
			if(userDTO.getPassword() != null)
			{
				String orgPassword = userDTO.getPassword();
				userDTO.setPassword(BCrypt.hashpw(orgPassword, BCrypt.gensalt(10)));
			}
			userService.save(userDTO);
		}
		return userDTO;
	}
	
	@PutMapping("/api/user")
	public UserDTO updateUser(@RequestBody UserDTO userDTO) {
		userService.save(userDTO);
		return userDTO;
	}
	
	@DeleteMapping("/api/user")
	public void deleteUser(@RequestBody long[] ids) {
	}
}

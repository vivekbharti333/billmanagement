package com.datfuslab.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import org.hibernate.validator.constraints.Length;
import org.springframework.lang.NonNull;

@Entity
@Table(name = "users_details")
public class UsersDetails {
		
		@Id
		@GeneratedValue(strategy= GenerationType.IDENTITY)
		@Column(name = "id")
		private Long id;
		
		@Column(name = "secret_key")
		private String secretKey;
		
		@Lob
		@Column(name = "user_picture")
		private String userPicture;
		
		@Column(name = "user_code")
		private String userCode;
		
		@Column(name = "first_name")
		private String firstName;
		
		@Column(name = "last_name")
		private String lastName;
		
		@NonNull
		@Length(min = 5, max = 20)
		@Column(name = "login_id")
		private String loginId;
		
		@Column(name = "password")
		private String password;
		
		@Column(name = "status")
		private String status;
		
		@Column(name = "service")
		private String service;
		
		@Column(name = "permissions")
		private String permissions;
		
		@Column(name = "role_type")
		private String roleType;
		
		@Column(name = "mobile_no")
		private String mobileNo;
		
		@Column(name = "alternate_mobile")
		private String alternateMobile;
		
	

}

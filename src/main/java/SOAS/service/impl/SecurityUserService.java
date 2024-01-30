//package com.MBIP.service.impl;
//import com.MBIP.mapper.AdminMapper;
//import com.MBIP.mapper.UserMapper;
//import com.MBIP.pojo.Admin;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.User;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.stereotype.Service;
//
//import java.util.ArrayList;
//import java.util.List;
//
//// SecurityUserService.java
//// SecurityUserService.java
//// SecurityUserService.java
//// SecurityUserService.java
//@Service
//public class SecurityUserService implements UserDetailsService {
//    @Autowired
//    AdminMapper adminMapper;
//    @Autowired
//    UserMapper userMapper;
//    @Autowired
//    PasswordEncoder passwordEncoder;
//    // existing code
//
//    public com.MBIP.pojo.User findUserByName(String username) {
//        com.MBIP.pojo.User user =  userMapper.findUserByUsername(username);
//        return user;
//    }
//
//    @Override
//    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//        Admin admin = adminMapper.findAdminByName(username);
//        com.MBIP.pojo.User user = userMapper.findUserByUsername(username);
//
//        if (admin == null && user == null) {
//            throw new UsernameNotFoundException("User not found: " + username);
//        }
//
//        List<GrantedAuthority> authorities = new ArrayList<>();
//
//        if (admin != null) {
//            authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
//            // Other admin-related logic
//        } else {
//            authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
//            // Other user-related logic
//        }
//
//        // Use UserDetails builder accordingly based on admin or user
//        String encodedPassword = passwordEncoder.encode(admin != null ? admin.getPassword() : user.getPassword());
//
//        UserDetails userDetails = User.withUsername(admin != null ? admin.getName() : user.getName())
//                .password(encodedPassword)
//                .authorities(authorities)
//                .build();
//        return userDetails;
//    }
//}





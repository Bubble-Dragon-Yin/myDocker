//package com.MBIP.config;
//
//import com.MBIP.service.impl.SecurityUserService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.builders.WebSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.AuthenticationException;
//import org.springframework.security.core.authority.AuthorityUtils;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.security.web.authentication.AuthenticationFailureHandler;
//import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
//import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
//import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.Set;
//
//// SecurityConfig.java
//// SecurityConfig.java
//// SecurityConfig.java
//@Configuration
//@EnableWebSecurity
//public class SecurityConfig extends WebSecurityConfigurerAdapter {
//
//    @Autowired
//    private SecurityUserService securityUserService;
//
//    @Autowired
//    private PasswordEncoder passwordEncoder;
//
//    @Override
//    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//        auth.userDetailsService(securityUserService)
//                .passwordEncoder(passwordEncoder);
//    }
//
//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//        http.authorizeRequests()
//                .antMatchers("/").permitAll()
//                .antMatchers("/user/**").hasRole("USER")
//                .antMatchers("/admin/**").hasRole("ADMIN")
//                .antMatchers("/news/**").hasRole("ADMIN")
//                .antMatchers("/event/**").hasRole("ADMIN")
////                .antMatchers("/event/**").hasRole("ADMIN")
//                .anyRequest().authenticated()
//                .and()
//                .formLogin()
//                .loginPage("/login/form")
//                .loginProcessingUrl("/login")
//                .successHandler(myAuthenticationSuccessHandler())  // Custom success handler
//                .failureUrl("/error")
//                .permitAll()
//                .and()
//                .logout()
//                .logoutUrl("/logout")
//                .logoutSuccessUrl("/")
//                .permitAll()
//                .and()
//                .httpBasic()
//                .and()
//                .csrf().disable();
//    }
//
//    @Bean
//    public AuthenticationSuccessHandler myAuthenticationSuccessHandler() {
//        return new MySimpleUrlAuthenticationSuccessHandler();
//    }
//
//    private static class MySimpleUrlAuthenticationSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
//
//        @Override
//        public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
//            Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
//
//            if (roles.contains("ROLE_ADMIN")) {
//                // Redirect to /admin/user_list if the user has the ROLE_ADMIN role
//                getRedirectStrategy().sendRedirect(request, response, "/admin/user_list");
//            } if(roles.contains("ROLE_USER")){
//                getRedirectStrategy().sendRedirect(request, response, "/emp_home.html");
//            } else {
//                // Use the default success URL for other roles
//                super.onAuthenticationSuccess(request, response, authentication);
//            }
//        }
//    }
//}






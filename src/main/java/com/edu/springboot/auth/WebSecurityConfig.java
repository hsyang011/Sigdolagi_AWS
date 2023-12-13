package com.edu.springboot.auth;
 
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import jakarta.servlet.DispatcherType;

/* 스프링 시큐리티 사용을 위한 전반적인 설정을 하기 위한 클래스
웹 컨테이너가 시작될 때 빈이 생성되어야 하므로 아래 어노테이션을 붙여준다. */
@Configuration
public class WebSecurityConfig {
   
   /* 에러핸들러 등록을 위해 빈을 자동주입 받는다.
   주입받은 빈은 failureHandler()에 등록하면 된다. */
//   @Autowired
//   public MyAuthFailureHandler myAuthFailureHandler;
   
   @Bean
   public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
      /* 스프링 시큐리티는 특정 페이지에 로그인 확인을 위한 코드를 삽입하는 게 아닌, 아래와 같이 요청명의 패턴을 통해
      설정하게 된다.
      permitAll() : 인증없이 접근할 수 있는 페이지를 지정
      hasAnyRole() : 인증없이 접근할 수 있는 페이지를 지정. 단, 여러개 중 하나만 획득하면 접근할 수 있다.
      hasRole() : hasAnyRole()과 비슷하지만 한가지의 권한을 획득해야 접근할 수 있다.
      
      정적리소스가 있는 css, js, images와 guest의 경우에는 권한없이 누구나 접근할 수 있다.
      member하위는 USER 혹은 ADMIN 권한을 획득 후 접근할 수 있다.
      admin 하위는 ADMIN 권한만 접근할 수 있다. */
      http.csrf((csrf) -> csrf.disable())
         .cors((cors) -> cors.disable())
         .authorizeHttpRequests((request) -> request
            .dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
            .requestMatchers("/").permitAll()
//            .requestMatchers("/**").permitAll()
            .requestMatchers("/html/**", "/css/**", "/js/**", "/images/**", "/bootstrap/**", "/uploads/**").permitAll()
            // 게스트일 때
            .requestMatchers(
                  // community 접근 권한
                  "/community/**",
                  // main 접근 권한      
                  "/main/**",
                  // market 접근 권한
                  "/market/market_list.do", "/market/market_view.do",
                  // member 접근 권한
                  "/member/login.do", "/member/findIdpw.do", "/member/findIdpw.do", "/member/doubleckeck.do", "/member/regist.do",
                  "/member/registProcess.do", "/member/loginprocess.do", "/member/findEmail.do", "/member/findPass.do",
                  // planner 접근 권한
                  "/planner/planner_list.do", "/planner/sortPlannerByCate.do",
                  // 관리자 접근 권한 (우선은 풀어두고 추후에 제한하기)
                  "/administrator/**",
                  // restaurant 접근 권한
                  "/restaurant/**",
                  // search 접근 권한
                  "/search/**",
                  // service 접근 권한
                  "/service/**").permitAll()
//                  "/community/**", "/main/**", "/market/**", "/member/**", "/planner/**", "/restaurant/**",
//                  "/search/**", "/service/**").permitAll()
            // 유저 접근 권한, 관리자 페이지 외에 모든 페이지에 대한 접근 가능
            .requestMatchers("/community/**", "/market/**", "/member/**", "/planner/**").hasAnyRole("USER", "ADMIN")
            .requestMatchers("/admin/**").hasRole("ADMIN")
            .anyRequest().authenticated()
         );
      
      
      
      /* 로그인 페이지에 대한 디자인 커스터마이징
      loginPage : 로그인 페이지의 요청명
      loginProcessingUrl : 폼값을 전송하여 로그인 처리할 요청명
      failureUrl : 로그인에 실패한 경우 이동할 요청명
      failureHandler : 별도의 핸들러 인스턴스를 등록 후 에러처리
      usernameParameter : 아이디 입력을 위한 <input>의 name속성값
      passwordParameter : 패스워드의 name속성값 */
      http.formLogin((formLogin) -> formLogin
            .loginPage("/member/login.do") // default : /login
            .loginProcessingUrl("/member/loginprocess1.do")
            .defaultSuccessUrl("/main/main.do", true)
            .failureUrl("/member/login.do?error") // default : /login?error
//            .failureHandler(myAuthFailureHandler)
            .usernameParameter("email") // default : username
            .passwordParameter("password") // default : password
            .permitAll());
      /* 로그아웃에 대한 커스터마이징
      logoutUrl : 로그아웃을 위한 요청명
      logoutSuccessUrl : 로그아웃 이후 이동할 위치 */
      http.logout((logout) -> logout
            .logoutUrl("/member/logout.do") // default : /logout
            .logoutSuccessUrl("/")
            .permitAll());
      // 권한이 부족한 경우 이동할 위치
//      http.exceptionHandling((expHanding) -> expHanding.accessDeniedPage("/main/main.do"));
      
      
      
      return http.build();
   }
   
   // DB연결을 위한 데이터소스를 자동주입한다. 해당 설정은 프로퍼티 파일에 있다.
   @Autowired
   private DataSource dataSource;
   
   // 아래 2개의 쿼리문 실행을 통해 사용자의 인증정보와 권한을 인출한다. 시큐리티는 이를 통해 로그인 처리를 하게 된다.
   @Autowired
   protected void configure(AuthenticationManagerBuilder auth) throws Exception {
      auth.jdbcAuthentication()
         .dataSource(dataSource)
         .usersByUsernameQuery(" SELECT email, password, enabled "
               + " FROM member WHERE email=? ")
         .authoritiesByUsernameQuery(" SELECT email, authority "
               + " FROM member WHERE email=? ")
         .passwordEncoder(new BCryptPasswordEncoder());
   }
   
}
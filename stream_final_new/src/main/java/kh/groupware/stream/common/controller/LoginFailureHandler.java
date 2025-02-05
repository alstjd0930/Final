package kh.groupware.stream.common.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class LoginFailureHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception
			) throws IOException, ServletException {
		String msg;
		
		if (exception instanceof BadCredentialsException) {
			msg = "아이디 또는 비밀번호가 맞지 않습니다. 다시 확인해주세요.";
		} else if (exception instanceof InternalAuthenticationServiceException) {
			msg = "내부 시스템 문제로 로그인 요청을 처리할 수 없습니다. 관리자에게 문의하세요. ";
		} else if (exception instanceof UsernameNotFoundException) {
			msg = "아이디가 존재하지 않습니다, 회원가입 후 로그인해주세요.";
		} else if (exception instanceof AuthenticationCredentialsNotFoundException) {
			msg = "인증 요청이 거부되었습니다. 관리자에게 문의하세요.";
		} else {
			msg = "알 수 없는 오류로 로그인 요청을 처리할 수 없습니다. 관리자에게 문의하세요.";
		}

		request.getSession().setAttribute("msg", msg);
		response.sendRedirect("/stream/login");
	}
}

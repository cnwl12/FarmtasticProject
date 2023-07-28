package com.itwillbs.kakaoController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/member")
public class KakaoController {
	@GetMapping("/kakaorcallback")
	public String kakaojoin(@RequestParam String code) {
		return "code : " + code;
	}
}


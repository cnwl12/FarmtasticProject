package com.itwillbs.naverController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/member")
public class NaverController {
	@GetMapping("/navercallback")
	public String authNaver(@RequestParam String code) {
		return "code : " + code;
	}
}


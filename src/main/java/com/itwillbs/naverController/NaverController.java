package com.itwillbs.naverController;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/member")
public class NaverController {
	@GetMapping("/navercallback")
	public String authNaver(@RequestParam String code) {
		return "code : " + code;
	}
}


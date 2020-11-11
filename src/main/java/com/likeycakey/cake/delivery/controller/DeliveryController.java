package com.likeycakey.cake.delivery.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Locale;

/**
 * Handles requests for the application home page.
 */
@Controller
public class DeliveryController {
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/delivery.ca", method = RequestMethod.GET)
	public String delivery(Locale locale, Model model) {
		
		
		return "delivery/delivery";
	}
	
	
	
}

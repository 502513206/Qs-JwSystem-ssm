package JW.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import JW.pojo.TWeek;
import JW.service.WeekService;

import java.io.IOException;
import java.util.List;


@Controller
@RequestMapping("/week")
public class WeekAction {
	@Autowired
	private WeekService weekService;

	@RequestMapping("/listajax")
	@ResponseBody
	public List<TWeek> listajax() throws IOException {
		List<TWeek> list = weekService.findAll();
		return list;
	}
}

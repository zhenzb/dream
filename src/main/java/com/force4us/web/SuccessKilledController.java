package com.force4us.web;

import com.force4us.entity.SuccessKilledEntity;
import com.force4us.entity.UserEntity;
import com.force4us.service.SuccessKilledService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/successKilled")
public class SuccessKilledController {
    @Autowired
    SuccessKilledService successKilledService;

    @RequestMapping(value="/findUserSuccessKilled")
    public String findUserSuccesskilled(Model model,HttpSession session){
        UserEntity user =(UserEntity) session.getAttribute("user");
        List<SuccessKilledEntity> successKilledEntityList = successKilledService.findSuccessKilledByUserId(user.getId());
        model.addAttribute(successKilledEntityList);
        return "personalCenter";
    }
}

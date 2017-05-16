package controllers;


import domain.Question;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.QuestionService;

import javax.validation.Valid;
import java.util.Collection;

@Controller
@RequestMapping("/question")
public class QuestionController extends AbstractController {

    //Services ----------------------------------------------------------------

    @Autowired
    private QuestionService questionService;


    //Constructors----------------------------------------------

    public QuestionController() {
        super();
    }

    protected static ModelAndView createEditModelAndView(Question question) {
        ModelAndView result;

        result = createEditModelAndView(question, null);

        return result;
    }


    //Create Method -----------------------------------------------------------

    protected static ModelAndView createEditModelAndView(Question question, String message) {
        ModelAndView result;

        result = new ModelAndView("question/edit");
        result.addObject("question", question);
        result.addObject("message", message);

        return result;

    }

    protected static ModelAndView createEditModelAndView2(Question question) {
        ModelAndView result;

        result = createEditModelAndView2(question, null);

        return result;
    }
    // Edition ---------------------------------------------------------

    protected static ModelAndView createEditModelAndView2(Question question, String message) {
        ModelAndView result;

        result = new ModelAndView("question/editLess");
        result.addObject("question", question);
        result.addObject("message", message);

        return result;

    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView questionList() {

        ModelAndView result;
        Collection<Question> questions;

        questions = questionService.findAll();
        result = new ModelAndView("question/list");
        result.addObject("questions", questions);
        result.addObject("requestURI", "question/list.do");

        return result;
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView create(@RequestParam int id) {

        ModelAndView result;

        Question question = questionService.create();

        result = createEditModelAndView(question);

        return result;

    }

    // Ancillary methods ------------------------------------------------


    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam int questionId) {
        ModelAndView result;
        Question question;

        question = questionService.findOne(questionId);
        Assert.notNull(question);
        result = createEditModelAndView(question);

        return result;
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
    public ModelAndView save(@Valid Question question, BindingResult binding) {
        ModelAndView result;
        if (!binding.hasErrors()) {
            result = createEditModelAndView(question);
        } else {
            try {
                questionService.save(question);
                result = new ModelAndView("redirect:list.do");
            } catch (Throwable oops) {
                result = createEditModelAndView(question, "question.commit.error");
            }
        }
        return result;
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST, params = "delete")
    public ModelAndView delete(Question question) {
        ModelAndView result;
        try {
            questionService.delete(question);
            result = new ModelAndView("redirect:list.do");
        } catch (Throwable oops) {
            result = createEditModelAndView(question, "question.commit.error");
        }

        return result;
    }

}